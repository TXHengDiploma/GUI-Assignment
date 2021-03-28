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
                JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Opps...', text: 'Create Fail!', icon: 'error'})");
                out.print(job.build().toString());
                return;
            }

            String name = request.getParameter("member_name");
            String email = request.getParameter("member_email");
            String password = request.getParameter("member_password");
            Member member = new Member(name, email, password);

            Member.create(member);
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            JsonObjectBuilder job = Json.createObjectBuilder()
                    .add("script", "Swal.fire({title: 'Completed', text: 'Create Successfully', icon: 'success'})");
            out.print(job.build().toString());
            }
            
        }
        


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }   
}