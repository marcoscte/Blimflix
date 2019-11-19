import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegistroS")
public class RegistroS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroS() {
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
			System.out.println("Se conecto RegistroS");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto RegistroS");
			
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
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<html><head><title>Registro exitoso</title></head>");
			out.println("<body><font size=10>");
			
			String email = request.getParameter("mail");
			String name = request.getParameter("name");
			String lastname = request.getParameter("lastname");
			String password = request.getParameter("password");
			String bandera = null;
			int type = 1;
			try {
				statement = connection.createStatement();
				resultSet = statement.executeQuery("SELECT * FROM USUARIO WHERE EMAIL_USUARIO='"+email+"'");
				while(resultSet.next()) {
					bandera = resultSet.getString("EMAIL_USUARIO");
					System.out.println(bandera);
				}
				if(bandera == null ) {
					String queryInserta = "INSERT INTO USUARIO(NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL_USUARIO, CONTRASENIA_USUARIO, TIPO_USUARIO) VALUES (?,?,?,?,?)";
					PreparedStatement pSt = connection.prepareStatement(queryInserta);
					
					pSt.setString(1, name);
					pSt.setString(2, lastname);
					pSt.setString(3, email);
					pSt.setString(4, password);
					pSt.setInt(5, type);
					
					pSt.executeUpdate();
					pSt.close();
					resultSet.close();
					System.out.println("Se registro usuario con mail: "+email);
					response.sendRedirect("Login.jsp");
				} else {
					response.sendRedirect("RegistroError.jsp");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		//doGet(request, response);
	}

}
