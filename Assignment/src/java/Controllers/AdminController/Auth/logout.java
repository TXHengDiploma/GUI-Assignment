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

import Models.Member;

@WebServlet(name = "AdminLogout", urlPatterns = {"/admin/auth/logout"})
public class logout extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		request.getSession().invalidate();

		JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Logout Successfully', text: 'See you soon~', icon: 'success'}).then(()=>{location.href='/'})");

		out.print(job.build().toString());
	} 
}