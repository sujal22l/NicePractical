<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Management using Cookies</title>
</head>
<body>
<h2>Session Management using Cookies</h2>
<%@ page language = "java" %>
	<% 
		out.print("Hello " + request.getParameter("usernm"));
	%>

	<%! final int ONE_MIN = 60; 
	        int pgCount = 1;
	        boolean found;	%>
                          
	<%
		Cookie cookies[] = request.getCookies();
		if(cookies != null)
		{
			for(int i = 0; i <cookies.length;i++)
			{
				Cookie cookie = cookies[i];				
				if(cookie.getName().equals("pageCount"))
				{
					found = true;
					pgCount = Integer.parseInt(cookie.getValue());
					pgCount++;
					cookie.setValue(String.valueOf(pgCount));
					response.addCookie(cookie);
					break;
				}
				else
					found = false;
			}
		}
		if(cookies != null || found == false)
		{
			Cookie cookie = new Cookie("pageCount",String.valueOf(pgCount));
			cookie.setMaxAge(ONE_MIN);
			response.addCookie(cookie);			
		}
	out.println("You have hit the page "+pgCount+" time(s)");
		%>
		<a href = "CookiesDemo.jsp"> Hit Again</a>

</body>
</html>