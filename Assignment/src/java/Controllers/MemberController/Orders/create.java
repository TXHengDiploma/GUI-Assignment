package Controllers.MemberController.Orders;

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
}