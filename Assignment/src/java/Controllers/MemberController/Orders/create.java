package Controllers.MemberController.Orders;

import java.util.ArrayList;
import javax.json.*;
import java.io.*;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Address;
import Models.Cart;
import Models.Member;
import Models.Order;

@WebServlet(name = "MemberCreateOrder", urlPatterns = {"/member/orders/new"})
public class create extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}
		Member member = (Member) session.getAttribute("member");
		
        request.setAttribute("carts", member.myCart(request.getParameter("carts")));

		request.getRequestDispatcher("/member/orders/create.jsp").forward(request, response);
    }

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}
		Member member = (Member) session.getAttribute("member");
		double totalPrice = 0;
		int totalItem = 0;
		for( Cart cart : member.myCart(request.getParameter("carts")) ) {
			totalPrice += (cart.getProduct().getPrice() * cart.getQuantity());
			totalItem += cart.getQuantity();
		}
		Order order = new Order(member.getId(), Address.find(Integer.parseInt(request.getParameter("addressId"))), "pending", totalPrice, totalItem * 5, new Timestamp(System.currentTimeMillis()), null, null, null, null, false );
		order = Order.create(order);
        member.newOrder(request.getParameter("carts"), order);

		PrintWriter out = response.getWriter();
		JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title:'Complete', text:'Your order have been created successfully! Do you want to proceed to payment?', icon:'success', showCancelButton: true}).then(result => { location.href = result.isConfirmed ? '/member/orders/payment?id="+ order.getId() +"' : '/member/orders/list' })");
		out.print(job.build().toString());
    }
}