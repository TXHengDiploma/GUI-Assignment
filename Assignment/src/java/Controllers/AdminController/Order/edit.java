package Controllers.AdminController.Order;

import javax.json.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Order;

@WebServlet(name = "AdminOrderEdit", urlPatterns = {"/admin/orders/details"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
        Order order = Order.find(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("order", order);
        request.setAttribute("orderProducts", order.getOrderProducts());

        request.getRequestDispatcher("/admin/orders/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
		Order order = Order.find(Integer.parseInt(request.getParameter("id")));
        Timestamp now = new Timestamp(System.currentTimeMillis());
        String status = request.getParameter("status");
        if(status.equals("packing")){
            order.setPackingAt(now);
        } else if (status.equals("delivering")) {
            order.setDeliveringAt(now);
        } else if (status.equals("delivered")) {
            order.setDeliveredAt(now);
        }
        order.setStatus(status);
        order.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Product Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#order-table').ajax_html();})");
        out.print(job.build().toString());
    }  
}
