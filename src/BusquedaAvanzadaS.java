

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
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
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaAvanzadaS() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig servletConfig) throws ServletException{
		String URL = "jdbc:postgresql://localhost:5432/proyectoBD";
		String password = "root123";
		String username = "root";
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(URL, username, password);
			statement = connection.createStatement();
			String query = "SELECT * FROM USUARIO";
			resultSet = statement.executeQuery(query);
			System.out.println("Se conecto BusquedaSimpleS");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto BusquedaSimpleS");
			
		}
		
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
		serie.setTitulo(request.getParameter("titulo"));
		serie.setActor(request.getParameter("actor"));
		serie.setDirector(request.getParameter("director"));
		String temporadas = request.getParameter("temporadas");
		serie.setTemporadas(Integer.parseInt(temporadas));
		serie.setPais(request.getParameter("pais"));
		
		String queryHistorial = "INSERT INTO HISTORIAL_USUARIO(CVE_USUARIO, HISTORIAL) VALUES ("+usuario.getId()+", '"
		+serie
				+"')";
		try{
			resultSet = statement.executeQuery(queryHistorial);
		}catch(Exception e){
				System.out.println(":)");
			}
		
		
		sessionOk.setAttribute("usuario", usuario);
		sessionOk.setAttribute("serie", serie);
		int cve = 2;
		sessionOk.setAttribute("cve", cve);
		
		response.sendRedirect("BusquedaAvanzadaResult.jsp");
		doGet(request, response);
	}

}
