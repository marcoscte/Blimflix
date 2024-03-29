

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

import mx.resources.java.Usuario;

/**
 * Servlet implementation class BusquedaSimpleS
 */
@WebServlet("/BusquedaSimpleS")
public class BusquedaSimpleS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	private Usuario usuario;
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaSimpleS() {
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
		String busqueda = request.getParameter("busqueda");

		
		usuario = new Usuario();

		HttpSession sessionok = request.getSession(true);
		usuario = (Usuario) sessionok.getAttribute("usuario");
		
		String queryHistorial = "INSERT INTO HISTORIAL_USUARIO(CVE_USUARIO, HISTORIAL) VALUES ("+usuario.getId()+", '"+busqueda+"')";
		try{
			resultSet = statement.executeQuery(queryHistorial);
		}catch(Exception e){
				System.out.println(":)");
			}
		sessionok.setAttribute("busqueda", busqueda);

		response.sendRedirect("BusquedaSimple.jsp");
		
		
		
		
		
		
		
		doGet(request, response);
	}

}
