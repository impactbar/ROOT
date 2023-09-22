<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%@ page language="java" import="javax.naming.*"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

	<%
		String jndi = "java:/hajdbcDS";
		Context context = new InitialContext();
		DataSource ds = null;
		Connection conn = null;
      		PreparedStatement pstmt = null;
 		ResultSet rs = null;
		
		try 
		{

			StringBuffer buffer = new StringBuffer();
			Random random = new Random();
			String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".split(",");

			for (int i=0 ; i<4 ; i++)
			{
				buffer.append(chars[random.nextInt(chars.length)]);
			}

			ds = (DataSource)context.lookup(jndi);
			conn = ds.getConnection();
            		conn.setAutoCommit(false);
			String query = "insert into users (names) values (?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,buffer.toString());
			pstmt.executeUpdate(); 
			conn.commit();
			out.println("insert!");
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
				try { if ( pstmt != null ) pstmt.close(); } catch (Exception e) {} 
				try { if ( conn != null ) conn.close(); conn = null; } catch(Exception e) {}
				try { if ( context != null) context.close(); } catch (Exception e) {} 
		}

	%>

	</body>
</html>
