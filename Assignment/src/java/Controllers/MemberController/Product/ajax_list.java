package Controllers.MemberController.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Pagination;
import Models.Product;

@WebServlet(name = "MemberProductList", urlPatterns = {"/member/products/ajax_list"})
public class ajax_list extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int totalProduct = Product.count();
		int resultPerPage = 20;
		int totalPages = (int) Math.ceil((double) totalProduct / resultPerPage);
		System.out.println(request.getParameter("search"));
		System.out.println(request.getParameter("page"));
		int requestPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		Pagination pagination = new Pagination(totalPages, resultPerPage, requestPage, "/member/products/ajax_list?search="+(request.getParameter("search") != null ? request.getParameter("search") : "" ), "#product-list");

		request.setAttribute("pagination", pagination);
        request.setAttribute("products", Product.page(requestPage, resultPerPage));
        request.getRequestDispatcher("/member/products/ajax_products.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}