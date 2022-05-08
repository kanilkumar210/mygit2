<%@page import="com.pack.dao.CorporateDao"%>
<jsp:useBean id="u" class="com.pack.model.Corporate"></jsp:useBean>
<jsp:setProperty property="*" name="u" />


<%
	CorporateDao corDao = new CorporateDao();
	System.out.println(u.getCorporateName() + " " + u.getAddress() + " " + u.getPhoneNumber());
	int i = corDao.save(u);
	if (i > 0) {
		response.sendRedirect("adduser-success.jsp");
	} else {
		response.sendRedirect("adduser-error.jsp");
	}
%>