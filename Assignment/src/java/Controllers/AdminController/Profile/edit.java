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


@WebServlet(name = "AdminProfileEdit", urlPatterns = {"/admin/profile/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        if(session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/auth/login");
            return;
        }

        request.getRequestDispatcher("/admin/profile/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        if(session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/auth/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");
		
		admin.setName(request.getParameter("admin_name"));
       
        admin.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Update Profile Successfully', icon: 'success'})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
