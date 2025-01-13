<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,prodotti.ProductBean,java.text.DecimalFormat"%>


<%
	HttpSession sessione = request.getSession();
	ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>)sessione.getAttribute("prd");
	

	if(prodotti==null || prodotti.isEmpty()){
		response.sendRedirect(request.getContextPath()+"/ProdottiAD");
		return;
	}

	DecimalFormat df = new DecimalFormat("#.##");

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

<title>CoinVerter Sezione Admin</title>
</head>


<body
	onload="consoleText(['Hi, Admin.', 'Choose what you want to do'], 'text', ['tomato', 'rebeccapurple'])"
	onresize="brutta()">
	<jsp:include page='adminHeader.jsp'></jsp:include>

	<main class="bgPage">
		<div class="bg">
			<div class="prodBtn">
				<a id="addNewProduct" href="admin/ProdottoForm.jsp">AGGIUNGI
					PRODOTTO</a>
			</div>
			<section>
				<div class="container">
					<!-- items -->
					<table>
						<tr>
							<th></th>
							<th>ID</th>
							<th>NOME</th>
							<th>QUANTITA'</th>
							<th>PREZZO</th>
							<th>CATEGORIA</th>
							<th class="mamma"></th>
						</tr>
						<%for(ProductBean p : prodotti){%>
						<tr>
							<!--<td><img id="pImg" src="<%=getServletContext().getContextPath()%>/<%=p.getFoto()%>"	alt=""></td> -->
							<td><img id="pImg" src="<%=p.getFoto()%>"	alt=""></td>
							<td><%=p.getCode()%></td>
							<td><%=p.getName()%></td>
							<td><%=p.getQuantity()%></td>
							<td><%=df.format(p.getPrice())%></td>
							<td><%=p.getType()%></td>
							<td class="mamma" colspan="5">
								<div class="dataContainer center-item">
									<div class="modifyBtn">
										<a href="ModificaProdotto?id=<%= p.getCode()%>"><img src="img/icon/iconModify.png" alt="" class="remove-item"></a>
									</div>
									<div class="modifyBtn">
										<a href="Gestione?id=<%=p.getCode()%>&activity=delete"><img	src="img/icon/iconTrash.png" alt="" class="remove-item"></a>
									</div>
								</div>
							</td>
						</tr>
						<tr class="papa">
							<td colspan="4">
								<div class="dataContainer center-item">
									<div class="modifyBtn">
										<a href="ModificaProdotto?id=<%= p.getCode()%>"><img src="img/icon/iconModify.png" alt="" class="remove-item"></a>
									</div>
									<div class="modifyBtn">
										<a href="Gestione?id=<%=p.getCode()%>&activity=delete"><img	src="img/icon/iconTrash.png" alt="" class="remove-item"></a>
									</div>
								</div>
							</td>
						</tr>
						<%} %>
					</table>
				</div>
			</section>
		</div>
	</main>
</body>
</html>