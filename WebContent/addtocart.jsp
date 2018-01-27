<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String bookname = request.getParameter("bookname");
double price = Double.parseDouble(request.getParameter("price"));
if(session.getAttribute("book")!=null){
String totalBookName = (String)session.getAttribute("book");
totalBookName = totalBookName + " " + bookname;
session.setAttribute("book",totalBookName);
Double totalPrice = (Double)session.getAttribute("price");
totalPrice = totalPrice + price;
session.setAttribute("book",totalBookName);
session.setAttribute("price", totalPrice);
}else{
	System.out.println(bookname);
	System.out.println(price);
	session.setAttribute("book", bookname);
	session.setAttribute("price", price);
}
%>

<a href="buynow.jsp">CHECK OUT</a>


</body>
</html>