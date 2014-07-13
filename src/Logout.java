

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet(urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("name");
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>登出</title>");
		out.println("<meta http-equiv='refresh' content='1;url=home1.html'>");
		out.println("</head>");
		out.println("<body><br><br><br><br>");
		out.println("<h1 align=center>使用者"+user+"已登出");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
