package Controllers.MemberController.Address;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Address;
import Models.Member;

@WebServlet(name = "MemberAddressTable", urlPatterns = {"/member/addresses/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
            return;
        }

        Member member = (Member) session.getAttribute("member");

        request.setAttribute("addresses", member.getAddresses());
        request.getRequestDispatcher("/member/addresses/ajax_table.jsp").forward(request, response);
    }
}
