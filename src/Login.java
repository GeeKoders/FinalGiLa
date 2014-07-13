

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;




@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    MyDBDriver myDBDriver;
    Connection conn;
    Statement stmt;
    ResultSet rs;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.setAttribute("access", "Y") ;
        
        if (request.getParameter("email") != null && request.getParameter("password") != null) {
           
        	System.out.println(request.getParameter("email"));
            System.out.println(request.getParameter("password"));
            
        	ModelLogin model = new ModelLogin(request.getParameter("email"), request.getParameter("password"));
            
            if (model.result) {
//            	Cookie cookie = new Cookie("Gira020508000",model.getEmail());
//            	cookie.setMaxAge(60*60); //¬í¬°³æ¦ì
//            	response.addCookie(cookie);
            	
                session.setAttribute("access", "Y");
                session.setAttribute("name",model.getName());
                session.setAttribute("email", model.getEmail());
                session.setAttribute("sex", model.getSex());
                session.setAttribute("location", model.getLocation());
                
                RequestDispatcher view = request.getRequestDispatcher("home.html"); 
        		view.forward(request, response);
//                response.sendRedirect("home.html");
                System.out.println("setAttribute OK return page!");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                request.setAttribute("loginerrors", model.getLoginErrors());
                rd.forward(request, response);
                
            }
        }
        





    }
 private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("userInfo") != null)
            result = true;
        return result;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
