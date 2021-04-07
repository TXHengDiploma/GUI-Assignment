package Controllers.MemberController.Address;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Address;

@WebServlet(name = "MemberAddressList", urlPatterns = {"/member/addresses/ajax_table"})
public class ajax_table extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("addresses", Address.all());
        request.getRequestDispatcher("/member/addresses/ajax_table.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
