package Controllers.MemberController.Orders;

import javax.json.*;
import java.io.*;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Order;

@WebServlet(name = "MemberOrderPayment", urlPatterns = {"/member/orders/payment"})
public class payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}

		request.setAttribute("order", Order.find(Integer.parseInt(request.getParameter("id"))));

		request.getRequestDispatcher("/member/orders/payment.jsp").forward(request, response);
    }

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}

		Order order = Order.find(Integer.parseInt(request.getParameter("id")));
		order.setPayAt(new Timestamp(System.currentTimeMillis()));
		order.setIsPaid(true);
		order.setStatus("paid");
		order.update();

		PrintWriter out = response.getWriter();
		JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title:'Complete', text:'Payment Success', icon:'success'}).then(()=>location.href = '/member/orders/list')");
		out.print(job.build().toString());
    }

}