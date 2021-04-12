package Controllers.AdminController.Order;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Order;

@WebServlet(name = "MemberOrderDetails", urlPatterns = {"/member/orders/details"})
public class details extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Order order = Order.find(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("order", order);
        request.setAttribute("orderProducts", order.getOrderProducts());

        request.getRequestDispatcher("/member/orders/details.jsp").forward(request, response);
    }
}