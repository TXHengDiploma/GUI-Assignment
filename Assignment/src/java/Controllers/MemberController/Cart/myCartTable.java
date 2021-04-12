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

@WebServlet(name = "MemberCartTable", urlPatterns = {"/member/myCart/ajax_table"})
public class myCartTable extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
            return;
        }
        Member member = (Member) session.getAttribute("member");
		

        request.setAttribute("carts", member.myCart());

		request.getRequestDispatcher("/member/cart/ajax_table.jsp").forward(request, response);
    }
}