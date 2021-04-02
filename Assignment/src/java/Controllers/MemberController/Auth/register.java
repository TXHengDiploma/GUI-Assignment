package Controllers.MemberController.Auth;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Member;

@WebServlet(name = "MemberAdd", urlPatterns = {"/member/auth/signup"})
public class register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/auth/signup.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		if(!request.getParameter("member_password").equals(request.getParameter("member_confirmpass")))
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			response.setStatus(HttpServletResponse.SC_OK);
			JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Opps...', text: 'Your password isn\'t same, please try again.', icon: 'error'})");
			out.print(job.build().toString());
			return;
		}

		if(Member.findByEmail(request.getParameter("member_email")) != null){
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			response.setStatus(HttpServletResponse.SC_OK);
			JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", "Swal.fire({title: 'Opps...', text: 'This e-mail has been used by other user, please try another', icon: 'error'})");
			out.print(job.build().toString());
			return;
		}


		Member member = new Member(request.getParameter("member_name"), request.getParameter("member_email"), request.getParameter("member_password"));

		Member.create(member);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		JsonObjectBuilder job = Json.createObjectBuilder()
				.add("script", "Swal.fire({title: 'Completed', text: 'Create Successfully', icon: 'success'}).then(()=>{location.href='/member/auth/login'})");
		out.print(job.build().toString());
	}
}