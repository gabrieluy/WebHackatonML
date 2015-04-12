using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MeliSample
{
    public partial class gridOrders : System.Web.UI.UserControl
    {
        private MeliService ms = MeliService.GetService();
        public List<Order> ordenes { get; set; }
        public List<Currency> monedas { get; set; }
        
        public gridOrders()
		{
            ordenes = new List<Order>();
            monedas = ms.GetCurrency();
		}

        public string TransformDate(string date)
        {
            DateTime dt = DateTime.Parse(date);
            return dt.ToString("dd/MM/yyyyy");
        }

        public string TransformCurrency(string id)
        {
            string symbol = "";
            foreach (Currency item in monedas)
            {

                if (item.id == id)
                    return item.symbol;
            }
            return symbol;
        }

        public string Traducir(string nombreIngles)
        {
            switch (nombreIngles)
            {
                case "pending": return "pendiente";
                case "handling": return "procesado";
                case "ready_to_ship": return "listo enviar";
                case "shipped": return "enviado";
                case "delivered": return "entregado";
                case "not_delivered": return "no entregado";
                case "cancelled": return "cancelado";
                case "confirmed": return "confirmada";
                case "to_be_agreed": return "acordar envio";
                case "payment_required": return "Pago Requerido";
                case "payment_in_process": return "Pago en Proceso";
                case "paid": return "Pagada";

                default:
                    return nombreIngles;                    
            }
        }
    }
}