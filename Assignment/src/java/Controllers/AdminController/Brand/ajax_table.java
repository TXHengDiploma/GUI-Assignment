package Controllers.AdminController.Brand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Brand;

@WebServlet(name = "AdminBrandList", urlPatterns = {"/admin/brands/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("brands", Brand.all());
        request.getRequestDispatcher("/admin/brands/ajax_table.jsp").forward(request, response);
    }
}


