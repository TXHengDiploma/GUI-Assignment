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
import Models.Member;
import Models.Order;

@WebServlet(name = "MemberOrderAjaxTable", urlPatterns = {"/member/orders/ajax_table"})
public class ajax_table extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}
		Member member = (Member) session.getAttribute("member");
		
        request.setAttribute("orders", member.getOrders());

		request.getRequestDispatcher("/member/orders/ajax_table.jsp").forward(request, response);
    }
}