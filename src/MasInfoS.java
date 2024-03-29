




import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mx.resources.java.Usuario;

/**
 * Servlet implementation class MasInfoS
 */
@WebServlet("/MasInfoS")
public class MasInfoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	private Usuario usuario;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasInfoS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String cveS =  request.getParameter("cve12");
		System.out.println(cveS);
		int cve = Integer.parseInt(cveS);
		
		HttpSession sessionOk = request.getSession(true);
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		sessionOk.setAttribute("cve", cve);
		sessionOk.setAttribute("usuario", usuario);
		response.sendRedirect("MasInfo.jsp");
		doGet(request, response);
	}

}
