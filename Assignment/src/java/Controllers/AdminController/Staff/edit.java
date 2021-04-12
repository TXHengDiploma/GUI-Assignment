package Controllers.AdminController.Staff;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Admin;

@WebServlet(name = "AdminStaffEdit", urlPatterns = {"/admin/staffs/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Admin admin = Admin.find(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("staff", admin);
        request.getRequestDispatcher("/admin/staffs/edit_staff.jsp").forward(request, response);
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
                .add("script", "Swal.fire({title: 'Opps...', text: 'Create Fail!', icon: 'error'})");
            out.print(job.build().toString());
            return;
        }

        admin.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Staff Update Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#admin-table').ajax_html();})");
        out.print(job.build().toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}
