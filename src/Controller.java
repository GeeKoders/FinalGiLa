
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.util.* ; 

@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    public String desMatch;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //�קK�]�X�ӶýX
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        List errorMsgs=new LinkedList() ; 
        request.setAttribute("errorMsgs", errorMsgs);
        try{
            String desMatch=request.getParameter("desMatch").trim() ; 
           if(new Model(request.getParameter("area"), request.getParameter("desMatch")).dataQuery(request.getParameter("area"), request.getParameter("desMatch"))==0 && request.getParameter("desMatch").length()!=0)
            {
                errorMsgs.add("Cant find the real place!");
            }
            if(request.getParameter("area").equals("null")){
                errorMsgs.add("Please select a place") ; 
            }
            if (!errorMsgs.isEmpty()){
                request.setAttribute("errorMsgs", errorMsgs);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
             Model model = new Model(request.getParameter("area"), request.getParameter("desMatch"));
            //���o��ݳB�z���᪺�y��(coodStr)�B���I�W��(viewStr)�B²��(viewIntroStr)�M�Ϥ�(picStr)
            request.setAttribute("area",request.getParameter("area"));
            request.setAttribute("coodStr", model.coordinataeSearch());
            request.setAttribute("viewStr", model.viewSearch());
            request.setAttribute("viewIntroStr", model.viewIntroSearch());
            request.setAttribute("picStr", model.picSearch());
            request.setAttribute("divStr", model.divSearch());
            request.getRequestDispatcher("viewpoint.jsp").forward(request, response);
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
           



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
