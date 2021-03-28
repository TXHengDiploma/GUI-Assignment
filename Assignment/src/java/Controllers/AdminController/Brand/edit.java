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

@WebServlet(name = "AdminBrandEdit", urlPatterns = {"/admin/brands/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Brand brand = Brand.find(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("brand", brand);
        request.getRequestDispatcher("/admin/brands/edit_brand.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		String name = request.getParameter("brand_name");
		String imageString = request.getParameter("brand_img");
		String description = request.getParameter("brand_desc");

		Brand brand = Brand.find(Integer.parseInt(request.getParameter("id")));
		
		brand.setName(name);
        brand.setImageString(imageString);
		brand.setDescription(description);
        brand.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Brand Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#brand-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
