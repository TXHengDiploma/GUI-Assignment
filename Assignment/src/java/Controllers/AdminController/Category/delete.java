package Controllers.AdminController.Category;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Category;

@WebServlet(name = "AdminCategoryDelete", urlPatterns = {"/admin/categories/delete"})
public class delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Category category = Category.find(Integer.parseInt(request.getParameter("id")));
		
		category.delete();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Category Delete Successfully', icon: 'success'}).then(()=>{$('#category-table').ajax_html();})");
        out.print(job.build().toString());
    }
}
