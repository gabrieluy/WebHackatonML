jQuery.jPrintArea = function (el, orderId) {

    //alert("Entre al Print Area " + orderId);

    //obtengo la informacion para imprimir e imprimo la orden de envio
    alert("entre a imprimirOrden" + el + " id orden " + orderId);
    var dataImprimir = $('#datosImpresionEtiqueta' + orderId).html();
    alert("Datos para Imprimir " + dataImprimir);
    $('#areaImpresionOrden').html("");
    $('#areaImpresionOrden').append(dataImprimir);
    
    //Genero el Codigo de Barras
    $("#barcodeTarget").html("");
    var value = orderId;
    var btype = "code128";
    var renderer = $("input[name=renderer]:checked").val();
    var settings = {
        output: renderer,
        barWidth: "2",
        barHeight: "75",       
    };
    $("#barcodeTarget").barcode(value, btype, settings);
        
    var iframe = document.createElement('IFRAME');
    var doc = null;
    $(iframe).attr('style', 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;');
    document.body.appendChild(iframe);
    doc = iframe.contentWindow.document;
    var links = window.document.getElementsByTagName('link');
    for (var i = 0; i < links.length; i++)
        if (links[i].rel.toLowerCase() == 'stylesheet')
            doc.write('<link type="text/css" rel="stylesheet" href="' + links[i].href + '"></link>');
    doc.write('<div class="' + $(el).attr("class") + '">' + $(el).html() + '</div>');
    doc.close();
    iframe.contentWindow.focus();
    iframe.contentWindow.print();

    /*
    $('#dialog_impresion').dialog({
    modal: true,
    width: 400,
    height: 400,
    buttons: {
    "Aceptar": function () {
    $("#dialog_impresion").css("display", "none");
    $(this).dialog("close");
    }
    }
    });
    */

    document.body.removeChild(iframe);
    
}





