
import java.sql.*;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginS
 */
@WebServlet("/LoginS")
public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginS() {
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
			System.out.println("Se conecto LoginS");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto LoginS");
			
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");		
		String queryUsuario = "SELECT * FROM USUARIO WHERE EMAIL_USUARIO = '"+email+"' AND CONTRASENIA_USUARIO = '"+password+"'";
		String mail = "";
		String pass = "";
		String nombre = "";
		int type =0;
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryUsuario);
			while(resultSet.next()) {
				mail = resultSet.getString("EMAIL_USUARIO");
				pass = resultSet.getString("CONTRASENIA_USUARIO");
				type = resultSet.getInt("TIPO_USUARIO");	
				nombre = resultSet.getString("NOMBRE_USUARIO");
			}
			if(!mail.equals(email) && !pass.equals(password)) {
				response.sendRedirect("LoginError.jsp");
			}else if(mail.equals(email) && pass.equals(password) && type == 1){
				HttpSession sessionOk = request.getSession(true);
				sessionOk.setAttribute("nombre", nombre);
				sessionOk.setAttribute("tipo", type);
				sessionOk.setAttribute("mail", mail);
				response.sendRedirect("IndexUsuario.jsp");
			}else if(mail.equals(email) && pass.equals(password) && type == 2) {
				HttpSession sessionOk = request.getSession(true);
				sessionOk.setAttribute("nombre", nombre);
				sessionOk.setAttribute("tipo", type);
				sessionOk.setAttribute("mail", mail);
				response.sendRedirect("IndexAdmin.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error LoginS");
		}
		
		
	}

}
