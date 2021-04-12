package Controllers.AdminController.Order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Order;

@WebServlet(name = "AdminOrderList", urlPatterns = {"/admin/orders/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("orders", Order.all());
        request.getRequestDispatcher("/admin/orders/ajax_table.jsp").forward(request, response);
    }
}