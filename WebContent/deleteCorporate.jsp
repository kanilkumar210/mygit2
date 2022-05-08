<%@page import="com.pack.model.Corporate"%>
<%@page import="com.pack.dao.CorporateDao"%>
<%-- <jsp:useBean id="u" class="com.pack.model.Corporate.Corporate"></jsp:useBean>
<jsp:setProperty property="*" name="u" /> --%>

<%
	CorporateDao corDao = new CorporateDao();
	int id = Integer.parseInt(request.getParameter("id"));
	corDao.delete(id);
	response.sendRedirect("viewusers.jsp");
%>