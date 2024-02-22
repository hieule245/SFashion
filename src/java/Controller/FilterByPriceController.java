package Controller;

import DAO.DAO;
import dto.Product;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class FilterByPriceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] priceRanges = {"all", "below100", "below200", "below300", "below400", "below500"};
        int[] lowerBounds = {0, 0, 100, 200, 300, 400};
        int[] upperBounds = {0, 100, 200, 300, 400, 500};

        Set<Product> listResult = new HashSet<>();
        DAO dao = new DAO();

        for (int i = 0; i < priceRanges.length; i++) {
            String priceRange = request.getParameter(priceRanges[i]);
            if (priceRange != null) {
                if (i == 0) {
                    listResult.addAll(dao.getAllActiveProducts());
                } else {
                    listResult.addAll(dao.filterProductByPrice(lowerBounds[i], upperBounds[i]));
                }
                request.setAttribute(priceRanges[i] + "Checked", true);
            }
        }

        request.setAttribute("listP", new ArrayList<>(listResult));
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
