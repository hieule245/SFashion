/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raiku
 */
public class FilterByPriceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String all = request.getParameter("all");
        String below100 = request.getParameter("below100");
        String below200 = request.getParameter("below200");
        String below300 = request.getParameter("below300");
        String below400 = request.getParameter("below400");
        String below500 = request.getParameter("below500");
        List<Product> listResult = new ArrayList<>();
        if (all != null){
            listResult = new DAO().getAllActiveProducts();
        }else{
            if (below100 != null){
                listResult.addAll(new DAO().filterProductByPrice(0, 100));
            }
            if (below200 != null){
                listResult.addAll(new DAO().filterProductByPrice(100, 200));
            }
            if (below300 != null){
                listResult.addAll(new DAO().filterProductByPrice(200, 300));
            }
            if (below400 != null){
                listResult.addAll(new DAO().filterProductByPrice(300, 400));
            }
            if (below500 != null){
                listResult.addAll(new DAO().filterProductByPrice(400, 500));
            }
        }
        request.setAttribute("listP", listResult);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
