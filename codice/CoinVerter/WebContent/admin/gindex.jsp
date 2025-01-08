
<!DOCTYPE html>
<html lang="it" dir="ltr">
<%@ page import="java.util.ArrayList,coin.Ordine,utenti.User"%>

<%
	User admin = (User)request.getSession().getAttribute("user");
	if(!admin.isAdmin()){
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
	ArrayList<Ordine> ordini =(ArrayList<Ordine>) request.getSession().getAttribute("ordini");
	if(ordini == null){
		response.sendRedirect(request.getContextPath() + "/Ordini");
		return;
	}
%>

<head>
<link rel="shortcut icon" type="image/gif" href="../img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css"
	href="../CSS/light.css">
<script src="../JS/scripts.js"></script>

<title>CoinVerter</title>
</head>

<body
	onload="consoleText(['Ciao, <%=admin.getNome()%>', 'Pagina di gestione ordini'], 'text', ['gold', 'grey'])"
	onresize="brutta()">
	<jsp:include page='adminHeader.jsp'></jsp:include>
	<main>
		<div class="filterAdmin">
			<a href="Ordini"><input type="text" value="RIMUOVI FILTRO"></a>
			<form id="filterForm" method="POST" action="Ordini">
				<input name="user" id="orderFilter" type="input"
					placeholder="filter..." /><input type="date" name="start"
					value="<%=java.time.LocalDate.now()%>" /><input type="date"
					name="end" value="<%=java.time.LocalDate.now()%>" /> <input
					id="btnFilter" type=submit value="FILTRA"></input>
			</form>
		</div>
		<table>
			<tr>
				<th colspan="2">E-MAIL</th>
				<th>ID ORDINE</th>
				<th>DATA</th>
				<th>QUANTITA'</th>
				<th>PRODOTTO</th>
				<th>TIPO</th>
				<th>COSTO</th>
			</tr>
			<%for(Ordine o: ordini){ %>
			<tr>
				<td colspan="2"><%=o.getEmail()%></td>
				<td><%=o.getID_ordine()%></td>
				<td><%=o.getData_acquisto()%></td>
				<td><%=o.getQ_acquisto()%></td>
				<td><%=o.getNome_prodotto()%></td>
				<td><%=o.getTipo_prodotto()%></td>
				<td><%=o.getPrezzo()%></td>
			</tr>
			<%} %>
		</table>
	</main>
</body>
</html>