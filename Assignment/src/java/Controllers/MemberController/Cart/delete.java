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

@WebServlet(name = "MemberCartDelete", urlPatterns = {"/member/cart/delete"})
public class delete extends HttpServlet {

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

        if(request.getParameter("id") == null){
            job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Oops', text: 'You didn\'t provide a product', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }
		
        int cartId = Integer.parseInt(request.getParameter("id"));

        member.deleteFromCart(cartId);

		job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Completed', text: 'Product removed from your cart successfully', icon: 'success'}).then(()=>{$('#cart-table').ajax_html()})");
		out.print(job.build().toString());
    }
}