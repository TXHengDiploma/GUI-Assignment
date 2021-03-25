package Controllers.AdminController.Product;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Product;

@WebServlet(name = "AdminProductAdd", urlPatterns = {"/admin/products/add"})
public class add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/products/add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("prod_name");
        double price = Double.parseDouble(request.getParameter("prod_price"));
        Product product = new Product(name,price);

        Product.create(product);

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'New Product Save Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#product-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
