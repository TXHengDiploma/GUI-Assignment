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
        request.getRequestDispatcher("/admin/auth/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
            if(!request.getParameter("admin_password").equals(request.getParameter("admin_confirmpass")))
            {
                JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Create Fail!', icon: 'error'})");
                out.print(job.build().toString());
                return;
            }

            String name = request.getParameter("admin_name");
            String email = request.getParameter("admin_email");
            String password = request.getParameter("admin_password");
            Admin admin = new Admin(name, email, password);

            Admin.create(admin);
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            JsonObjectBuilder job = Json.createObjectBuilder()
                    .add("script", "Swal.fire({title: 'Completed', text: 'Create Successfully', icon: 'success'})");
            out.print(job.build().toString());
            }
        

    

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}