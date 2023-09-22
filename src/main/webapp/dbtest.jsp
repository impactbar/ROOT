<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%@ page language="java" import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

	<%
		String jndi = "java:/mysqlDS";
		Context context = new InitialContext();
		DataSource ds = null;
		Connection conn = null;
		Statement stmt = null;
 		ResultSet rs = null;
		try 
		{
			ds = (DataSource)context.lookup(jndi);
			conn = ds.getConnection();
			stmt=conn.createStatement();
			out.println("DataSource lookup OK!");
			out.println("<br />");
			rs=stmt.executeQuery("select 1 "); 
			while(rs.next())
			{ 
				out.print("<br />"); 
				out.println("select value : " + rs.getString("1")); 
			} 
		} 
		catch (NamingException e)
		{
			e.printStackTrace();
			out.println("Connection Pool Error : " + e.getMessage());
			out.println("<br />");
		} 
		finally 
		{
			 
				try { if ( rs != null ) rs.close(); } catch (Exception e) {} 
				try { if ( stmt != null ) stmt.close(); } catch (Exception e) {} 
				try { if ( conn != null ) conn.close(); conn = null; } catch(Exception e) {}
				try { if ( context != null) context.close(); } catch (Exception e) {} 
		}

	%>

	</body>
</html>
