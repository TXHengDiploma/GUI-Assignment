package Controllers.AdminController.Order;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Member;
import Models.Order;

@WebServlet(name = "AdminOrderList", urlPatterns = {"/admin/orders/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Order> orders;
        if(request.getParameter("month") != null && request.getParameter("year") != null){
            orders = Order.byMonth(Integer.parseInt(String.valueOf(request.getParameter("month"))), Integer.parseInt(String.valueOf(request.getParameter("year"))));
        } else if (request.getParameter("memberId") != null){
            Member member = Member.find(Integer.parseInt(request.getParameter("memberId")));
            orders = member.getOrders();
        } else  {
            orders = Order.all();
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/orders/ajax_table.jsp").forward(request, response);
    }
}