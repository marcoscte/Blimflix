

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
 * Servlet implementation class CalificaS
 */
@WebServlet("/CalificaS")
public class CalificaS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private Serie serie;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalificaS() {
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
			System.out.println("Se conecto CalificaS");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto CalificaS");
			
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
		HttpSession sessionOk = request.getSession(true);
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		int cveSerieS = (int) sessionOk.getAttribute("cve_serie");
		String calificacion = request.getParameter("calificacion");
		System.out.println(usuario+" "+ cveSerieS + " "+calificacion );
		int calificacionI = Integer.parseInt(calificacion);
		String queryCalifica1 = "INSERT INTO USUARIO_SERIE (CVE_USUARIO, CVE_SERIE, CALIFICACION) VALUES (" +usuario.getId()+","
								+cveSerieS+"," + calificacionI+")";
		String queryVerifica="SELECT * FROM USUARIO_SERIE WHERE CVE_USUARIO = "+ usuario.getId()+ " AND CVE_SERIE = "+cveSerieS;
		int j=0;
		try {
		ResultSet rs1 = statement.executeQuery(queryVerifica);
		while(rs1.next()) {
			j++;
		} 
		if(j==0) {
			try {
			resultSet = statement.executeQuery(queryCalifica1);
			sessionOk.setAttribute("usuario", usuario);
			response.sendRedirect("IndexUsuario1.jsp");
			}catch(Exception e) {
				System.out.println(":sjdnslkdf");
				response.sendRedirect("IndexUsuario1.jsp");
			}
		}else {
			sessionOk.setAttribute("usuario", usuario);
			response.sendRedirect("IndexUsuario2.jsp");
		}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
