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

@WebServlet(name = "MemberCart", urlPatterns = {"/member/myCart"})
public class myCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			response.sendRedirect("/member/auth/login");
			return;
		}
		
		request.getRequestDispatcher("/member/cart/my_cart.jsp").forward(request, response);
    }
}