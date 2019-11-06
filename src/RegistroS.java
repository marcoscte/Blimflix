import org.postgresql.Driver;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistroS
 */
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
		String URL = "jdbc:postgresql://localhost:5432/postgres";
		String password = "root";
		String username = "root";
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(URL, username, password);
			statement = connection.createStatement();
			String query = "SELECT * FROM pruebas";
			resultSet = statement.executeQuery(query);
			System.out.println("Conectossss");
			}catch(Exception e){
				e.printStackTrace();
			
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
	}

}
