<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="gridOrders.ascx.cs" Inherits="MeliSample.gridOrders" %>
<table class="ch-datagrid">
    <thead>
        <tr>
        	<th scope="col">Orden N°</th>
            <th scope="col">Fecha</th>
            <th scope="col">Total</th>
            <th scope="col">Comprador</th>
            <th scope="col">Estado Orden</th>
            <th scope="col">N° Envio</th>            
            <th scope="col">Estado Envio</th>
            <th scope="col">Etiqueta Envio</th>
            <th scope="col" style="display:none">DatosEtiqueta</th>
        </tr>
    </thead>
    <tbody>
		<% foreach(var item in ordenes) { %>
		<tr>
			<td><%= item.id %></td> 			
			<td><%= TransformDate(item.date_created) %></td>              
			<td> 
                <% string curr = TransformCurrency(item.currency_id); %>
                <p><%= curr %>  <%= item.total_amount %></p> 
            </td>		
            <td><%= item.buyer.nickname %> </td>
            <td><%= Traducir(item.status)%> </td>            
            <td><%= (item.shipping.id!=null ? item.shipping.id.ToString() : "" )%> </td>            
            <td><%= Traducir(item.shipping.status)%> </td>
            <td> 	
                <a id="print">			
			        <img src="assets/imprimir.png" onclick="$.jPrintArea('#areaImpresionOrden', '<%= item.id %>');" style="cursor:pointer;" alt="item image" />
                </a>	
            </td>
            <td style="display:none">
                <div id="datosImpresionEtiqueta<%= item.id %>">
                    <div id="infoComprador"> 
	                    <h3>Destinatario</h3>
                        <div id="nameComprador">
                          <span>Leonardo Casep</span>
                        </div> 
                        <div id="nicknameComprador">
                           <span>COCOUNO</span>
                        </div>          
                        <div id="localidadComprador">
                          <span>  Montevideo, Montevideo </span>
		                </div>         
                        <div id="addressComprador">
				            <span>Torricelli 4623 <br /> (12300), Montevideo</span>
			            </div>
                        <div id="phoneComprador">
				            <span>098 885213</span>     
			            </div>          
                        <div id="emailComprador">     
				            <span>cocouno@adinet.com.uy</span>
			            </div>
			            <div id="observacionesComprador">
			                <span>"De Lunes a Viernes 14 a 18"</span>
		                </div>
	                </div>
                    <div id="datosEnvio">
		                <h3>Datos Envio </h3>	
		                <div id="nroEnvio">
			                <span>Nro de Envio: 12345678</span>
		                </div>
                    </div>
                    <!-- datos del vendedor -->
	                <div id="infoVendedor"> 
	                  <h3>Remitente</h3>
                        <div id="nameVendedor">
                            <span>Leonardo Casep</span>
                        </div> 
                        <div id="nicknameVendedor">
                            <span>COCOUNO</span>
                        </div>          
                        <div id="localidadVendedor">
                            <span>  Montevideo, Montevideo </span>
		                </div>         
                        <div id="addressVendedor">
				            <span>Torricelli 4623 <br>(12300), Montevideo</span>
			            </div>
                        <div id="phoneVendedor">
				            <span>098 885213</span>     
			            </div>          
                        <div id="emailVendedor">     
				            <span>cocouno@adinet.com.uy</span>
			            </div>
	                </div>
                </div>
            </td>   
		</tr>
		<%}%>
	</tbody>
</table>

