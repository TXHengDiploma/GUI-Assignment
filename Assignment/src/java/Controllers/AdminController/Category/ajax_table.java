package Controllers.AdminController.Category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Category;

@WebServlet(name = "AdminCategoryList", urlPatterns = {"/admin/categories/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", Category.all());
        request.getRequestDispatcher("/admin/categories/ajax_table.jsp").forward(request, response);
    }
}
