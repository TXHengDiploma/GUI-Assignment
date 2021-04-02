package Controllers.MemberController.Brand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Brand;

@WebServlet(name = "MemberBrandDetail", urlPatterns = {"/member/brands/detail"})
public class detail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("brand", Brand.find(Integer.parseInt(request.getParameter("id"))));
        request.getRequestDispatcher("/member/brands/detail.jsp").forward(request, response);
    }
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}