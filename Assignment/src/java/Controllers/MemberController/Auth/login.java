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

@WebServlet(name = "MemberLogin", urlPatterns = {"/member/auth/login"})
public class login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("member") != null){
			Member member = (Member) session.getAttribute("member");
			if(member.auth()){
				response.sendRedirect("/member/products/list.jsp");
				return;
			}
		}

		request.getRequestDispatcher("/member/auth/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		Member member = Member.findByEmail(request.getParameter("memberemail"));
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);

		String returnScript = "";

		if(member == null) {
			returnScript = "Swal.fire({title: 'Opps...', text: 'This e-mail is not registered before, do you want to create an account?', icon: 'error'})";
		} else if(!member.getPassword().equals(Member.hashPassword(request.getParameter("memberpassword")))) {
			returnScript = "Swal.fire({title: 'Opps...', text: 'Invalid Password! ', icon: 'error'})";
		} else {
			request.getSession().invalidate();
			request.getSession().setAttribute("member", member);
			returnScript = "Swal.fire({title: 'Completed', text: 'Login Successfully', icon: 'success'}).then(()=>{location.href='/member/products/list.jsp'})";
		}
		JsonObjectBuilder job = Json.createObjectBuilder()
			.add("script", returnScript);
			out.print(job.build().toString());
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}   
}