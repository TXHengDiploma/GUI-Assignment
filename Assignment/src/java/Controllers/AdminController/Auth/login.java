package Controllers.AdminController.Auth;

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

@WebServlet(name = "AdminLogin", urlPatterns = {"/admin/auth/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("admin") != null){
            Admin admin = (Admin) session.getAttribute("admin");
            if(admin.auth()){
                response.sendRedirect("/admin/products/list.jsp");
                return;
            }
        }

        request.getRequestDispatcher("/admin/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        Admin admin = Admin.findByEmail(request.getParameter("admin_email"));
        
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);

        String returnScript = "";

        if(admin == null) {
            returnScript = "Swal.fire({title: 'Opps...', text: 'This e-mail does not exist in our database', icon: 'error'})";
        } else if(!admin.getPassword().equals(Admin.hashPassword(request.getParameter("admin_pass")))) {
            returnScript = "Swal.fire({title: 'Opps...', text: 'Wrong Password! ', icon: 'error'})";
        } else {
            request.getSession().invalidate();
            request.getSession().setAttribute("admin", admin);
            returnScript = "Swal.fire({title: 'Completed', text: 'Login Successfully', icon: 'success'}).then(()=>{location.href='/admin/products/list.jsp'})";
        }
        JsonObjectBuilder job = Json.createObjectBuilder()
            .add("script", returnScript);
            out.print(job.build().toString());
    } 
}