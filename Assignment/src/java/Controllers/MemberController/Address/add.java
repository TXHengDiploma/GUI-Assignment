package Controllers.MemberController.Address;

import javax.json.*;
import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Address;
import Models.Member;

@WebServlet(name = "MemberAddressAdd", urlPatterns = {"/member/addresses/add"})
public class add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/member/addresses/add_address.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
            return;
        }

        Member member = (Member) session.getAttribute("member");

        String receiverName = request.getParameter("receiverName");
        String remarkName = request.getParameter("remarkName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        Address address = new Address(receiverName, remarkName, email, phoneNumber, street, city, state, postalCode);
        
        member.addAddress(address);

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'New Address Save Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#address-table').ajax_html();})");
        out.print(job.build().toString());
    }
}