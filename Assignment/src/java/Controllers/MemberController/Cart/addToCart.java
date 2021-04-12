package Controllers.MemberController.Cart;

import java.util.ArrayList;
import javax.json.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Member;
import Models.Product;

@WebServlet(name = "MemberCartAdd", urlPatterns = {"/member/cart/add"})
public class addToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job;

        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Oops', text: 'Please login in first!', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }

        Member member = (Member) session.getAttribute("member");

        if(request.getParameter("productId") == null){
            job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Oops', text: 'You didn\'t provide a product', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }
		
        int productId = Integer.parseInt(request.getParameter("productId"));

        if(Product.find(productId) == null) {
            job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Oops', text: 'Product not found! Please try another one', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }

        int quantity = request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 1;

        member.addToCart(productId, quantity);

		job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Completed', text: 'Product added to your cart successfully', icon: 'success'})");
		out.print(job.build().toString());
    }
}