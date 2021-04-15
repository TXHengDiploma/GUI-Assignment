package Controllers.AdminController.Staff;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Admin;

@WebServlet(name = "AdminStaffList", urlPatterns = {"/admin/staffs/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
        request.setAttribute("staffs", Admin.allStaffs());
        request.getRequestDispatcher("/admin/staffs/ajax_table.jsp").forward(request, response);
    }
}


