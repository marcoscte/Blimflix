import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
public class Registrar  {
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	
	
	public void init(ServletConfig servletConfig) throws ServletException{
		String URL = "jdbc:postgresql://localhost:5432/testSQL.test";
		String password = "root";
		String username = "root";
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(URL, username, password);
			statement = connection.createStatement();
			String query = "SELECT * FROM testSQL.test";
			resultSet = statement.executeQuery(query);
			System.out.println("Conectossss");
			}catch(Exception e){
				e.printStackTrace();
			
		}
		
	}
}
