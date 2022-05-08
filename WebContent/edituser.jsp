<%@page import="com.pack.dao.CorporateDao"%>
<jsp:useBean id="u" class="com.pack.model.Corporate"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	CorporateDao corDao = new CorporateDao();

	int i = corDao.update(u);
	System.out.println(u);
	response.sendRedirect("viewusers.jsp");
%>