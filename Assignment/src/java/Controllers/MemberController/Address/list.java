package Controllers.MemberController.Address;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Member;

@WebServlet(name = "MemberAddressList", urlPatterns = {"/member/myAddresses"})
public class list extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") == null) {
			request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
			return;
		}

        request.getRequestDispatcher("/member/addresses/list.jsp").forward(request, response);
    } 
}