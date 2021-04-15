package Controllers.AdminController.Member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Member;

@WebServlet(name = "AdminMemberDetails", urlPatterns = {"/admin/members/details"})
public class details extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("member", Member.find(Integer.parseInt(request.getParameter("id"))));
        request.getRequestDispatcher("/admin/members/details.jsp").forward(request, response);
    }
}