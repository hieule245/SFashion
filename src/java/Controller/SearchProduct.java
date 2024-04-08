package Controller;

import DAO.DAO;
import dto.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SearchProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch(action){
            case "highest":
                //so stub thing
                request.getRequestDispatcher("shop.jsp").forward(request, response);
                break;
            case "lowest":
                //so stub thing
                request.getRequestDispatcher("shop.jsp").forward(request, response);
                break;
        }
        
//        try {
//            BigDecimal minPrice = new BigDecimal(minPriceStr);
//            BigDecimal maxPrice = new BigDecimal(maxPriceStr);
//
//            DAO productDAO = new DAO();
//            List<Product> products = productDAO.getProductsByPriceRange(minPrice, maxPrice);
//
//            request.setAttribute("products", products);
//            request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
//        }catch (NumberFormatException e) {
//            response.getWriter().println("Giá tiền phải là số.");
//        }
        // Handle the exception according to your application's requirements
        
    }
    
 
}
