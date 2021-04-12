package Controllers.MemberController.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Product;

@WebServlet(name = "MemberProductDetail", urlPatterns = {"/member/products/detail"})
public class detail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("product", Product.find(Integer.parseInt(request.getParameter("id"))));
        request.getRequestDispatcher("/member/products/detail.jsp").forward(request, response);
    }
}