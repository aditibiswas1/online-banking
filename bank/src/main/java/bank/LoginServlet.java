package bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String UserName, password;
	Connection conn;
	Statement stmt;
	AccountModel am = null;
	boolean pass_wrong = false;
	 public LoginServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserName = request.getParameter("UserName");
		password = request.getParameter("password");

		System.out.println(UserName);
		System.out.println(password);

		try {
			// Getting database connection
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();

			stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(
					"select * from bank where username ='" + UserName + "'" + "and password='" + password + "'");

			if (!rs.isBeforeFirst()) {
				request.setAttribute("isPassOK", "No");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			} else {
				while (rs.next()) {
					pass_wrong = true;
					// Setting all variables to model class
					am = new AccountModel();
					am.setAccount_no(rs.getString(1));
					am.setFirst_name(rs.getString(2));
					am.setLast_name(rs.getString(3));
					am.setAddress(rs.getString(4));
					am.setCity(rs.getString(5));
					am.setBranch(rs.getString(6));
					am.setZip(rs.getString(7));
					am.setUsername(rs.getString(8));
					am.setPassword(rs.getString(9));
					am.setPhone_number(rs.getString(10));
					am.setEmail(rs.getString(11));
					am.setAccount_type(rs.getString(12));
					am.setReg_date(rs.getString(13));

					ResultSet rs1 = stmt.executeQuery("select * from account where id ='" + am.getAccount_no() + "'");
					System.out.println(am.getAccount_no());
					while (rs1.next()) {
						am.setAmount(rs1.getInt(2));
					}

					// Setting Session variable for current User
					HttpSession session = request.getSession();
					session.setAttribute("userDetails", am);

					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}