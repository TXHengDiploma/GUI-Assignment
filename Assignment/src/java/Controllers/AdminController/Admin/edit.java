package Controllers.AdminController.Admin;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Admin;

@WebServlet(name = "AdminAdminEdit", urlPatterns = {"/admin/admins/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Admin admin = Admin.find(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/admins/edit_admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		String name = request.getParameter("admin_name");
        String role = request.getParameter("admin_role");
		String email = request.getParameter("admin_email");
		String password = request.getParameter("admin_pass");
        String confirmpass = request.getParameter("admin_confirmpass");

		Admin admin = Admin.find(Integer.parseInt(request.getParameter("id")));
		PrintWriter out = response.getWriter();

		admin.setName(name);
		admin.setRole(role);

        if(!request.getParameter("admin_pass").equals(request.getParameter("admin_confirmpass")))
        {
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'You have entered a different password.', icon: 'error'})");
            out.print(job.build().toString());
            return;
        } else {
            admin.setPassword(password);
        }

        
        admin.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Admin Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#admin-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
