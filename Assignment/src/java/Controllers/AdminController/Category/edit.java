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

@WebServlet(name = "AdminCategoryEdit", urlPatterns = {"/admin/categories/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Category category = Category.find(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("category", category);
        request.getRequestDispatcher("/admin/categories/edit_category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		String name = request.getParameter("cate_name");
		String icon = request.getParameter("cate_icon");
		String description = request.getParameter("cate_desc");

		Category category = Category.find(Integer.parseInt(request.getParameter("id")));
		
		category.setName(name);
        category.setIcon(icon);
		category.setDescription(description);
        category.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Category Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#category-table').ajax_html();})");
        out.print(job.build().toString());
    } 
}
