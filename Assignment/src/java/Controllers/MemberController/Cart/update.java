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

@WebServlet(name = "MemberCartUpdate", urlPatterns = {"/member/cart/update"})
public class update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job;

        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            job = Json.createObjectBuilder()
                .add("script", "$.notify('You have to login before update!','error')");
            out.print(job.build().toString());
            return;
        }

        Member member = (Member) session.getAttribute("member");

        if(request.getParameter("id") == null){
            job = Json.createObjectBuilder()
                .add("script", "$.notify('Product is undefine','error')");
            out.print(job.build().toString());
            return;
        }
		
        int cartId = Integer.parseInt(request.getParameter("id"));

		if(request.getParameter("quantity") == null){
            job = Json.createObjectBuilder()
                .add("script", "$.notify('Quantity is undefine','error')");
            out.print(job.build().toString());
            return;
        }
		
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        member.updateCart(cartId, quantity);

		job = Json.createObjectBuilder()
			.add("script", "$.notify('Cart Updated','success')");
		out.print(job.build().toString());
    }
}