package Controllers.MemberController.Brand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Pagination;
import Models.Brand;

@WebServlet(name = "MemberBrandList", urlPatterns = {"/member/brands/ajax_list"})
public class ajax_list extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Brand> brands = new ArrayList<Brand>();
        
        String query = "";
        if(request.getParameter("filter") != null){
            String filters[] = request.getParameter("filter").split("@");
            for(int i = 0; i < filters.length; i++){
                query += filters[i];
                if(i != filters.length - 1){
                    query += " AND ";
                }
            }
        }
        
        if(request.getParameter("search") != null){
            if(query.length() != 0){
                query += " AND ";
            }

            query += "( LOWER(name) LIKE '%" + request.getParameter("search").toLowerCase()+"%' OR LOWER(description) LIKE '%" + request.getParameter("search").toLowerCase()+"%' )";
        }

        if(query.length() != 0){
            System.out.println(query);
            brands = Brand.filter(query);
        } else {
            brands = Brand.all();
        }

		int totalBrand = brands.size();
		int resultPerPage = 20;
		int totalPages = (int) Math.ceil((double) totalBrand / resultPerPage);
		int requestPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		Pagination pagination = new Pagination(totalPages, resultPerPage, requestPage, "/member/brands/ajax_list?search="+(request.getParameter("search") != null ? request.getParameter("search") : "" ), "#brand-list");

		request.setAttribute("pagination", pagination);
        request.setAttribute("brands", Brand.page(requestPage, resultPerPage, query));
        request.getRequestDispatcher("/member/brands/ajax_brands.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}