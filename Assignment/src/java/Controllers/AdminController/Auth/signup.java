package Controllers.AdminController.Auth;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Admin;

@WebServlet(name = "AdminAdd", urlPatterns = {"/admin/auth/signup"})
public class signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
        request.getRequestDispatcher("/admin/auth/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }

        PrintWriter out = response.getWriter();
        
        if(!request.getParameter("admin_password").equals(request.getParameter("admin_confirmpass")))
        {
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Create Fail!', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }

        if(Admin.findByEmail(request.getParameter("admin_email")) != null){
            response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			response.setStatus(HttpServletResponse.SC_OK);
			JsonObjectBuilder job = Json.createObjectBuilder()
			    .add("script", "Swal.fire({title: 'Opps...', text: 'This e-mail has been used by other user, please try another', icon: 'error'})");
			out.print(job.build().toString());
			return;
        }

        Admin admin = new Admin(request.getParameter("admin_name"), request.getParameter("role"),request.getParameter("admin_email"), request.getParameter("admin_password"));

        Admin.create(admin);

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        JsonObjectBuilder job = Json.createObjectBuilder()
            .add("script", "Swal.fire({title: 'Completed', text: 'Create Successfully', icon: 'success'})");
        out.print(job.build().toString());
    }
}