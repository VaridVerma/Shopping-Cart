<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type=text name=username> <input type=text
			name=password> <input type=text name=confirmpassword>

		<input type=submit name=submit value=submit>

	</form>
	<%!/* private static Connection getConnection() throws ClassNotFoundException, SQLException {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","cdac");
			return connection;
		} */%>
	<%
		String submit = request.getParameter("submit");
		String username = "";
		String password = "";
		if (submit != null && submit.equalsIgnoreCase("submit")) {
			username = request.getParameter("username");
			password = request.getParameter("password");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system",
					"cdac");
			Statement stmt = connection.createStatement();
			String insertQry = "insert into reg values('" + username + "','" + password + "')";
			stmt.executeUpdate(insertQry);
			int updateCount = stmt.getUpdateCount();
			if (updateCount > 0) {
				out.println("REGISTRATION SUCCESS");
			}else{
				out.println("REGISTRATION Failed");
			}
		}
	%>
</body>
</html>