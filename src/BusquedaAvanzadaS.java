

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

import mx.resources.java.Serie;
import mx.resources.java.Usuario;

/**
 * Servlet implementation class BusquedaAvanzadaS
 */
@WebServlet("/BusquedaAvanzadaS")
public class BusquedaAvanzadaS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private Serie serie;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaAvanzadaS() {
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
		serie = new Serie();
		usuario = new Usuario();
		HttpSession sessionOk = request.getSession(true);
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		System.out.println(usuario);
		serie.setTitulo(request.getParameter("titulo"));
		serie.setActor(request.getParameter("actor"));
		serie.setDirector(request.getParameter("director"));
		String temporadas = request.getParameter("temporadas");
		serie.setTemporadas(Integer.parseInt(temporadas));
		serie.setPais(request.getParameter("pais"));
		sessionOk.setAttribute("usuario", usuario);
		sessionOk.setAttribute("serie", serie);
		int cve = 2;
		sessionOk.setAttribute("cve", cve);
		
		response.sendRedirect("BusquedaAvanzadaResult.jsp");
		doGet(request, response);
	}

}
