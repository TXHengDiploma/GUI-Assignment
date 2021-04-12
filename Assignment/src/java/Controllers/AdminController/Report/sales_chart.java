package Controllers.AdminController.Report;

import java.util.ArrayList;
import javax.json.*;
import java.io.IOException;
import java.time.YearMonth;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Order;

@WebServlet(name = "AdminSalesReport", urlPatterns = {"/admin/reports/sales_chart"})
public class sales_chart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		int month = Integer.parseInt(request.getParameter("month")), year = Integer.parseInt(request.getParameter("year"));
		YearMonth ym = YearMonth.of(year, month);
		int size = ym.lengthOfMonth();
		double[] results = Order.salesReport(month, year, size+1);

		request.setAttribute("results",results);
		request.setAttribute("maxsize",size);
        request.getRequestDispatcher("/admin/reports/monthly_sales_chart.jsp").forward(request, response);
    }
}