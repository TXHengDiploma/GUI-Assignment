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

@WebServlet(name = "AdminProductEdit", urlPatterns = {"/admin/products/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Product product = Product.find(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("product", product);
        request.getRequestDispatcher("/admin/products/edit_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		String name = request.getParameter("prod_name");
		double price = Double.parseDouble(request.getParameter("prod_price"));
		String imageString = request.getParameter("prod_img");
		String description = request.getParameter("prod_desc");

		Product product = Product.find(Integer.parseInt(request.getParameter("id")));
		
		product.setName(name);
		product.setPrice(price);
        product.setImageString(imageString);
		product.setDescription(description);
        product.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Product Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#product-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
