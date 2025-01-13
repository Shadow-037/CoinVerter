<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css" href="../CSS/light.css">
<title>CoinVerter Login</title>
<%//ProductBean prod = new ProductBean();%>
</head>
<body class="bgPage">
	<div class="login">
		<div class="loginForm">
			<h2>Aggiungi Prodotto</h2>
			<form action="Checkout" method="POST">
				<input type="text" name="nome" placeholder="Nome" required="required">
				<input type="number" name="price" placeholder="Prezzo" required="required" step="0.01" min="0">
				<select name="tipo" required="required">
					<option value="" disabled selected hidden>Categoria</option>
					<option value="valuta">Valuta</option>
					<option value="crypto">Cryptovaluta</option>
					<option value="ricarica">Ricarica carta</option>
					<option value="moneta">Valuta di gioco</option>
				</select>
				<input type="file" name="foto" accept=".png, .jpg, .jpeg" required="required">
				<button type="submit">Conferma</button>
			</form>
			
			<script>
  				function updateSelectColor(selectElement) {
    				if (selectElement.value) {
      					selectElement.classList.add("valid");
    				} else {
      					selectElement.classList.remove("valid"); 
    				}
  				}

  				document.querySelectorAll("select").forEach(select => {
    				select.addEventListener("change", function () {
      					updateSelectColor(this);
   					 });
  				});
			</script>
			
		</div>
	</div>
</body>
</html>
