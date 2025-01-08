<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,utenti.User"%>


<%
	HttpSession sessione = request.getSession();
	ArrayList<User> prodotti = (ArrayList<User>)sessione.getAttribute("acc");
	
	if(session.getAttribute("REFRESH")!=null){
	    response.sendRedirect("../your_servlet");
	}
	else{    
	session.setAttribute("REFRESH","TRUE");
	}
	
	if(prodotti==null || prodotti.isEmpty()){
		response.sendRedirect(request.getContextPath()+"/GestioneACC");
		return;
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css"
	href="CSS/light.css">
<script src="JS/scripts.js"></script>

<title>CoinVerter</title>
</head>


<body
	onload="consoleText(['account.', 'Choose what you want to do'], 'text', ['tomato', 'rebeccapurple'])"
	onresize="brutta()">
	<jsp:include page='adminHeader.jsp'></jsp:include>

	<main class="bgPage">
		<div id="kakatoca" class="bg">
			<section>
				<table>
					<tr>
						<th>NOME</th>
						<th>COGNOME</th>
						<th>EMAIL</th>
						<th>STATUS ADMIN</th>
						<th class="mamma"></th>
					</tr>
					<%for(User u: prodotti){ %>
					<tr>
						<td><%=u.getNome()%></td>
						<td><%=u.getCognome()%></td>
						<td><%=u.getEmail()%></td>
						<td><%=u.isAdmin()%></td>
						<td class="mamma" colspan="5">
							<div class="dataContainer center-item">
								<div class="modifyBtn">
									<a href="Manage?activity=modify&email=<%=u.getEmail()%>"><img
										src="<%=getServletContext().getContextPath()%>/img/icon/iconModify.png"
										alt="" class="remove-item"></a>
								</div>
								<div class="modifyBtn">
									<a href="Manage?activity=remove&email=<%=u.getEmail()%>"><img
										src="<%=getServletContext().getContextPath()%>/img/icon/iconTrash.png"
										alt="" class="remove-item"></a>
								</div>
							</div>
						</td>
					</tr>
					<tr class="papa">
						<td colspan="4">
							<div class="dataContainer center-item">
								<div class="modifyBtn">
									<a href=""><img
										src="<%=getServletContext().getContextPath()%>/img/icon/iconModify.png"
										alt="" class="remove-item"></a>
								</div>
								<div class="modifyBtn">
									<a href="Manage?activity=remove&email=<%=u.getEmail()%>"><img
										src="<%=getServletContext().getContextPath()%>/img/icon/iconTrash.png"
										alt="" class="remove-item"></a>
								</div>
							</div>
						</td>
					</tr>
					<%} %>
				</table>
			</section>
		</div>
		<script src="app.js"></script>
	</main>
</body>
</html>