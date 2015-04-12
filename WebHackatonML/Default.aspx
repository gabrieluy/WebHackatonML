<%@ Page Language="C#" Inherits="MeliSample.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head runat="server">
	<title>MercadoLibre Logistics</title>
	
	<link rel="stylesheet" href="~/css/chico-0.12.2.css" />
	<link rel="stylesheet" href="~/css/chico-mesh.css" />
	
	<style>
	
	.title_h1 {
		background:transparent url('../assets/main.png') 0 0 no-repeat;
		width: 63px;
		height: 36px;
		text-indent: 999px;
		overflow: hidden;
		margin-top: 14px;
		margin-left: 15px;
	}
	
	.title_h2 {
		margin-top:21px;
		color:#999;
		size:20px;
		font-family: "Lucida Grande", Arial, sans-serif;
	}
	
	</style>
	
</head>

<body>	
	<h1 class="title_h1"></h1>
    <br /> 
    <br />
	<h2 class="title_h2">MercadoLibre Logistics</h2>    
    <br />
    <br />

	<form id="searchForm" runat="server">		
		<div id="divOrders">			
            <asp:Button id="btnOrders" runat="server" Text="Search Orders" OnClick="btnOrdersClicked" CssClass="ch-btn"/>
    	</div>    	
		<asp:PlaceHolder runat="server" ID="resultsPlaceHolder" />		
	</form>
	
    <div id="areaImpresionOrden" style="display:block;">                        
    </div>

    <div id="Div4">   
        <div id="barcodeTarget" class="barcodeTarget"></div>
        <canvas id="canvasTarget" width="150" height="150"></canvas>
    </div>
            
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-barcode.js" type="text/javascript"></script>
    <script src="js/jquery.jPrintArea.js" type="text/javascript"></script>

</body>
</html>
