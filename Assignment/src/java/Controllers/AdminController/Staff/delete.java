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

@WebServlet(name = "AdminStaffDelete", urlPatterns = {"/admin/staffs/delete"})
public class delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") == null) {
            request.getRequestDispatcher("/admin/auth/login.jsp").forward(request,response);
            return;
        }
		Admin admin = Admin.find(Integer.parseInt(request.getParameter("id")));
		
		admin.delete();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Staff Delete Successfully', icon: 'success'}).then(()=>{$('#admin-table').ajax_html();})");
        out.print(job.build().toString());
    } 
}
