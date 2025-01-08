
<%@ page import="prodotti.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link id="mystylesheet" rel="stylesheet" type="text/css"
	href="CSS/light.css">
<style>
.modify {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.modifyForm {
	width: 300px;
	padding: 30px;
	border: 1px solid #f1f1f1;
	background: #fff;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.10);
	display: flex;
	flex-direction: column;
	align-items: center;
	border-radius: 20px;
}

.label {
	margin: 15px 0 5px 0;
	font-weight: bold;
	color: #333;
}

.input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 16px;
}

#button {
	padding: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-left: auto;
	margin-right: auto;
	border: none;
	background-color: #FFF350;
	color: #444B56;
	border-radius: 20px;
	padding-bottom: 10px;
}

#button:hover {
	background-color: #FFFF6A;
}

#stringa {
	margin-top: 5px;
}

input[type="radio"] {
	margin-right: 5px;
}

modifyForm>label[for="si-no"] {
	margin-top: 15px;
	font-weight: bold;
	color: #333;
}

modifyForm>label {
	display: inline-block;
	margin-bottom: 10px;
}

input[type="radio"]+label {
	margin-right: 15px;
	color: #333;
}
</style>
<title>CoinVerter Modifica Prodotti</title>
<%ProductBean prod = new ProductBean(); %>
</head>
<body class="bgPage">
	<div class="modify">
		<form class="modifyForm" action="Gestione?activity=add" method="POST">
			<label class="label" for="numero">ID Prodotto</label> <input
				class="input" type="text" id="numero" name="code" required><br>
			<label class="label" for="nome">Nome:</label> <input class="input"
				type="text" id="nome" name="nome"><br> <label
				class="label" for="valore">Quantità</label> <input class="input"
				type="number" id="valore" name="quantità" required><br>
			<label class="label" for="stringa">Tipo</label> <select id="stringa"
				name="stringa" required>
				<option value="valuta" required>Valuta</option>
				<option value="crypto" required>Cryptovaluta</option>
				<option value="ricarica" required>Ricarica Card</option>
				<option value="moneta" required>Valuta di gioco</option>
			</select> <label class="label" for="available">Si/No:</label><br> <input
				class="input" type="radio" id="si" name="available" value="true"
				required> <label for="true">Si</label> <input class="input"
				type="radio" id="no" name="available" value="false" required>
			<label for="false">No</label><br> <input id="button"
				class="input" type="submit" value="Invia">
		</form>
	</div>
</body>
</html>