<%@ page import="utenti.User" language="java" contentType="text/html;"%>
<%! String userIcon = "img/iconUserLog.png"; %>
<% if(session.getAttribute("user") == null) userIcon = "img/iconUser.png"; %>

<!DOCTYPE html>
<html lang="it" dir="ltr">

<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css"
	href="CSS/light.css">

<title>CoinVerter</title>
</head>

<body>
	<!-- <script type="text/javascript">
        var setTheme = localStorage.getItem('theme')
        console.log('theme:', setTheme)

        if (setTheme == null){
          swapStyle('CSS/light.css')
        }else{
          swapStyle(setTheme)
        }
  
        function swapStyle(sheet){
          document.getElementById('mystylesheet').href = sheet
          localStorage.setItem('theme', sheet)
        }
    </script>-->

	<!--Header-->

	<script>
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? 'img/logo.png' : 'img/logoName.png';
      logo.src = logoSrc;
    }
    window.addEventListener('load', switchLogo);
    window.addEventListener('resize', switchLogo);
    
    function ricerca(){
    	let filter = document.getElementById("inputbar").value;
    	
    	sessionStorage.setItem('filter', filter);
    	window.location.href="http://localhost/CoinVerter/shop.jsp";
    }
  </script>

	<header id="header-block" name="top">
		<section>
			<div id="container">
				<div id="logoBox">
					<img id="logo" src='' alt="">
				</div>
				<div id="collection">
					<div id="shop">
						<a href="shop.jsp"> SHOP </a>
					</div>
				</div>
				<div class="searchContainer">
					<img id="searchIcon" src="img/iconSearch.png" alt=""
						onclick="ricerca()">
					<button id="searchBtn">
						<img id="searchIconBtn" src="img/iconSearch.png" alt=""
							isOpenSearchbar>
					</button>
					<input type="text" id="input" name="searchBox"
						placeholder="Search...">
					<!--implementare lmodo per inviare la ricerca-->
				</div>
				<div id="toggle">
					<div id="loginButton" class="cartContainer"
						onclick="checkLogin(user)">
						<div class="position">
							<img class="icon" src=<%= userIcon %> alt="">
							<!--implementare lo switch dell'icona quando l'utente è loggato-->
							<span class="caption">LOGIN</span>
						</div>
					</div>
					<div class="cartContainer">
						<div class="position">
							<div class="badge yellow">0</div>
							<a href="cart.html"><img class="icon" src="img/iconCart.png"
								alt=""></a> <span class="caption">CART</span>
						</div>
					</div>
					<div class="cartContainer" isOpenSidebar>
						<div class="position">
							<img class="icon" src="img/iconWallet.png" alt=""> <span
								class="caption">WALLET</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</header>

	<div class="searchbar" hidden>
		<div class="searchbarOverlay"></div>
		<div class="searchbarContent">
			<div class="searchbarBody">
				<input type="text" id="inputbar" name="searchBox"
					placeholder="Search...">
				<button class="btn" id="close">
					<img class="icon" src="img/iconX.png" alt="">
				</button>
			</div>
			<button class="btn">
				<img class="icon" src="img/iconSearch.png" alt="">
			</button>
		</div>
	</div>

	<div class="sidebar" hidden>
		<div class="sidebarOverlay"></div>
		<div class="sidebarContent">
			<div class="sidebarHeader">
				<h4>WALLET</h4>
				<img class="icon" src="img/iconX.png" alt="">
			</div>
			<div class="sidebarBody"></div>
		</div>
	</div>

	<script>
    function openSidebar() {
      const isSidebar = document.querySelector("[isOpenSidebar]");
      const sidebar = document.querySelector(".sidebar");
      const sidebarOverlay = document.querySelector(".sidebarOverlay");
      const closeSidebar = document.querySelector(".sidebarHeader .icon");

      isSidebar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (sidebar.classList.contains("show")) {
          sidebar.classList.remove("show");
          sidebar.classList.add("hidden");
        }
        else {
          sidebar.classList.add("show");
          sidebar.classList.remove("hidden");
        }
      });

      sidebarOverlay.addEventListener("click", (e) => {
        console.log("Clicked sidebar overlay");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });

      closeSidebar.addEventListener("click", (e) => {
        console.log("Clicked close sidebar button");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });
    }
    openSidebar();
  </script>

	<script>
    function openSearchbar() {
      const isSearchbar = document.querySelector("[isOpenSearchbar]");
      const searchbar = document.querySelector(".searchbar");
      const searchbarOverlay = document.querySelector(".searchbarOverlay");
      const closeSearchbar = document.querySelector(".searchbar .btn");
      //const btn =  document.querySelector("#searchBtn");

      isSearchbar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (searchbar.classList.contains("show")) {
          searchbar.classList.remove("show");
          searchbar.classList.add("hidden");
          //btn.classList.add("show");
          //btn.classList.remove("hidden");
        }
        else {
          searchbar.classList.add("show");
          searchbar.classList.remove("hidden");
          //btn.classList.remove("show");
          //btn.classList.add("hidden");
        }
      });

      searchbarOverlay.addEventListener("click", (e) => {
        console.log("Clicked searchbar overlay");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

      closeSearchbar.addEventListener("click", (e) => {
        console.log("Clicked close searchbar button");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

    }
    openSearchbar();

    function closeSearchbar() {
      const searchbar = document.querySelector(".searchbar");
      //const btn =  document.querySelector("#searchBtn");
      searchbar.classList.remove("show");
      searchbar.classList.add("hidden");
      //btn.classList.add("hidden");
    }
    function checkWindowWidth() {
      const searchbar = document.querySelector(".searchbar");
      if (window.innerWidth > 850 && searchbar.classList.contains("show")) {
        closeSearchbar();
      }
    }
    window.addEventListener("resize", checkWindowWidth);
    checkWindowWidth();



    /*
    checkLogin(obj){
      if(obj == null)window.location.replace("Coinverter/login.jsp");
    }
    */
  </script>

	<main class="bgPage">
		<div class="bg">
			<div class="flexContainer">
				<div class="flexbox">b1</div>
				<div class="flexbox">b2</div>
				<div class="flexbox">b3</div>
				<div class="flexbox">b4</div>
			</div>
		</div>
	</main>

	<footer>
		<div class="footerContainer">
			<div class="footerFlexbox">
				<img id="footerLogo" src="img/logoName.png" alt="">
			</div>
			<div class="footerFlexbox">
				<div class="menu">
					<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
			</div>
			<div class="footerFlexbox">
				<div class="social">
					<a href="" target="_blank"><img src="img/social/insta.png"
						alt=""></a> <a href="" target="_blank"><img
						src="img/social/x.png" alt=""></a> <a href="" target="_blank"><img
						src="img/social/youtube.png" alt=""></a> <a href=""
						target="_blank"><img src="img/social/linkedin.png" alt=""></a>
				</div>
			</div>
		</div>
		<div class="toTop">
			<a href="#top" class="topBtn"> <img src="img/up.png" alt="">
			</a>
		</div>
	</footer>
</body>

</html>