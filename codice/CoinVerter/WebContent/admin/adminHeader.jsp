
<%
/*
	controllo accesso solo admin...
*/
%>

<head>
<link rel="shortcut icon" type="image/gif"
	href="<%=getServletContext().getContextPath()%>/img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css"
	href="<%=getServletContext().getContextPath()%>/CSS/light.css">
<script src="<%=getServletContext().getContextPath()%>/JS/scripts.js"></script>
<title>CoinVerter</title>
</head>

<body
	onload="consoleText(['Hi, Admin.', 'Choose what you want to do'], 'text', ['tomato', 'rebeccapurple'])"
	onresize="brutta()">
	<header id="header-block">
		<div class="managementHeader">
			<div class="sidepanelBtn" onclick="bailandoo()">
				<img id="btnIcon"
					src="<%=getServletContext().getContextPath()%>/img/icon/iconMenu.png"
					alt="">
			</div>
			<div id="animationHeader" class='console-container'>
				<span id='text'></span>
				<div class='console-underscore' id='console'>&#95;</div>
			</div>
		</div>
	</header>
	<section>
		<div id="sidepanel" class="menuBar">
			<div class="extendBtn" onclick="scomparisci()">
				<a class="extend"> <img
					src="<%=getServletContext().getContextPath()%>/img/icon/right.png"
					alt="">
				</a>
			</div>
			<div id="sideMenu" class="category">
				<div id="sideItem" class="categoryItem">
					<a
						href="<%=getServletContext().getContextPath()%>/admin/gindex.jsp"
						class="sideSelection"> <img id="sideIcon" class="categoryIcon"
						src="<%=getServletContext().getContextPath()%>/img/icon/iconSettings.png"
						alt=""><span class="spec">HOME</span>
					</a>
				</div>
				<div id="sideItem" class="categoryItem">
					<a href="<%=getServletContext().getContextPath()%>/ProdottiAD"
						class="sideSelection"> <img id="sideIcon" class="categoryIcon"
						src="<%=getServletContext().getContextPath()%>/img/icon/iconProduct.png"
						alt=""><span class="spec">PRODUCTS</span>
					</a>
				</div>
				<div id="sideItem" class="categoryItem">
					<a href="<%=getServletContext().getContextPath()%>/GestioneACC"
						class="sideSelection"> <img id="sideIcon" class="categoryIcon"
						src="<%=getServletContext().getContextPath()%>/img/icon/iconUserSettings.png"
						alt=""><span class="spec">ACCOUNTS</span>
					</a>
				</div>
				<div id="sideItem" class="categoryItem">
					<a href="<%=getServletContext().getContextPath()%>/index.jsp"
						class="sideSelection"> <img id="sideIcon" class="categoryIcon"
						src="<%=getServletContext().getContextPath()%>/img/icon/iconBack.png"
						alt=""><span class="spec">BACK TO SITE</span>
					</a>
				</div>
			</div>
		</div>
	</section>



</body>