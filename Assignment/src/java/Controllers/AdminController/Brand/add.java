package Controllers.AdminController.Brand;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Brand;

@WebServlet(name = "AdminBrandAdd", urlPatterns = {"/admin/brands/add"})
public class add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
        request.getRequestDispatcher("/admin/brands/add_brand.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }

        String name = request.getParameter("brand_name");
        String imageString = request.getParameter("brand_img");
        String description = request.getParameter("brand_desc");
        Brand brand = new Brand(name, imageString, description);
        
        Brand.create(brand);
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'New Brand Save Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#brand-table').ajax_html();})");
        out.print(job.build().toString());
    } 
}