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

@WebServlet(name = "AdminLogin", urlPatterns = {"/admin/auth/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
            Admin admin = Admin.findByEmail(request.getParameter("admin_email"));
            
            if(admin == null)
            {
                JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Please type something...', icon: 'error'})");
                out.print(job.build().toString());
                return;
            }
            if(admin.getPassword().equals(request.getParameter("admin_pass")))
            {
                request.setCharacterEncoding("utf-8");
                response.setContentType("application/json");
                response.setStatus(HttpServletResponse.SC_OK);
                JsonObjectBuilder job = Json.createObjectBuilder()
                        .add("script", "Swal.fire({title: 'Completed', text: 'Login Successfully', icon: 'success'}).then(()=>{location.href='/admin/products/list.jsp'})");
                out.print(job.build().toString());
                return;
            }else
            {
                JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Invalid Password! ', icon: 'error'})");
                out.print(job.build().toString());
                return;
            }

            
            }
    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}