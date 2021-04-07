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
import Models.Brand;
import Models.Category;
import Models.Product;

@WebServlet(name = "MemberAddressEdit", urlPatterns = {"/member/addresses/edit"})
public class edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
            return;
        }

		request.setAttribute("address", Address.find(Integer.parseInt(request.getParameter("id"))));
        request.getRequestDispatcher("/member/addresses/edit_address.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("member") == null) {
            request.getRequestDispatcher("/member/auth/login.jsp").forward(request,response);
            return;
        }

        Address address = Address.find(Integer.parseInt(request.getParameter("id")));
        address.setRemarkName(request.getParameter("remarkName"));
        address.setReceiverName(request.getParameter("receiverName"));
        address.setEmail(request.getParameter("email"));
        address.setPhoneNumber(request.getParameter("phoneNumber"));
        address.setStreet(request.getParameter("street"));
        address.setState(request.getParameter("state"));
        address.setCity(request.getParameter("city"));
        address.setPostalCode(request.getParameter("postalCode"));
        address.update();

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        JsonObjectBuilder job = Json.createObjectBuilder()
                .add("script", "Swal.fire({title: 'Completed', text: 'Address Updated Successfully', icon: 'success'}).then(()=>{ $('#ajax-modal').modal('toggle'); $('#address-table').ajax_html();})");
        out.print(job.build().toString());
    }
}
