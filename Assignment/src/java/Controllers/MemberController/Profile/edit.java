package Controllers.MemberController.Profile;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Date;

import Models.Member;


@WebServlet(name = "MemberProfileEdit", urlPatterns = {"/member/profile/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            response.sendRedirect("/member/auth/login");
            return;
        }

        request.getRequestDispatcher("/member/profile/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            response.sendRedirect("/member/auth/login");
            return;
        }

        Member member = (Member) session.getAttribute("member");
		
		member.setName(request.getParameter("member_name"));
        member.setGender(request.getParameter("member_gender"));
        member.setBirthday(Date.valueOf(request.getParameter("member_birthday")));
        
       
        member.update();

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
