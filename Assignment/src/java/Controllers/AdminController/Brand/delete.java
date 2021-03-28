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

@WebServlet(name = "AdminBrandDelete", urlPatterns = {"/admin/brands/delete"})
public class delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Brand brand = Brand.find(Integer.parseInt(request.getParameter("id")));
		
		brand.delete();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Brand Delete Successfully', icon: 'success'}).then(()=>{$('#brand-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
