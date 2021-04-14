package Controllers.AdminController.Profile;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Admin;

@WebServlet(name = "AdminProfileEditPassword", urlPatterns = {"/admin/profile/edit_pass"})
public class edit_pass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if(session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/auth/login");
            return;
        }
		
        request.getRequestDispatcher("/admin/profile/edit_pass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        if(session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/auth/login");
            return;
        }
        Admin admin = (Admin) session.getAttribute("admin");

        if(!admin.getPassword().equals(Admin.hashPassword(request.getParameter("admin_password_old"))))
        {
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Current Password Is Wrong!', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }
        if(!request.getParameter("admin_password").equals(request.getParameter("admin_confirmpass")))
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
			JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Opps...', text: \"Your password isn\'t same, please try again.\", icon: 'error'})");
			out.print(job.build().toString());
			return;
		}
		
        admin.setPassword(request.getParameter("admin_password"));
        admin.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Update Password Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#profile-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
