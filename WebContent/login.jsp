
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pojo.*"%>
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
		<input type=text name=username> <input type=text name=password>

		<input type=submit name=submit value=submit>

	</form>

	<%
		String submit = request.getParameter("submit");
		String username = "";
		String password = "";
		List<Book> booksAL = new ArrayList<Book>();
		if (submit != null) {
			username = request.getParameter("username");
			password = request.getParameter("password");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system",
					"cdac");
			Statement stmt = connection.createStatement();
			String sql = "select 1 from reg where name = '" + username + "'" + "AND password = '" + password + "'";
			ResultSet rst =stmt.executeQuery(sql);
			
			if (rst.next()) {
				out.println("LOGIN SUCCESS");
				session.setAttribute("username", username);
				stmt = connection.createStatement();
				sql = "select * from books";
				rst =stmt.executeQuery(sql);
				while(rst.next()){
					String bookname = rst.getString("bookname");
					String category = rst.getString("category");
					double price = rst.getDouble("price");
					Book b = new Book(bookname, price, category);
					booksAL.add(b);
					System.out.println(b);
				}
			}else{
				out.println("LOGIN FAILURE");
			}
		}
	%>

	<table border=1>
		<tr>
			<th>NAme</th>
			<th>Category</th>
			<th>Price</th>
			<th>Add TO Cart</th>
		</tr>
		<%
	
		for(Book book: booksAL){
		String link = "addtocart.jsp?bookname=" + book.getBookname() + "" + "&price=" + book.getPrice() + "" ;
	%>


		<tr>
			<td><%=book.getBookname()%></td>
			<td><%=book.getCategory()%></td>
			<td><%=book.getPrice()%></td>
			<td><a href=<%=link%>>ADD TO CART</a></td>
		</tr>

	


	<%} %>
</table>

</body>
</html>