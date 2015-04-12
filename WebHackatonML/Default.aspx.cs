using System;
using System.Web;
using System.Web.UI;
using System.Collections.Generic;

namespace MeliSample
{
	public partial class Default : System.Web.UI.Page
	{

        private MeliService ms;
        private string autentication;
        private string clientID;

		protected override void OnLoad (EventArgs e)
		{
            base.OnLoad(e);


            string url = Request.Url.AbsoluteUri;
            string param = Request["code"];

            if (param != null)
            {
                autentication = param;
                clientID = param.Split('-')[2];
            }

            ms = MeliService.GetService();
		}
        
		public virtual void btnLogoutClicked (object sender, EventArgs args)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
        
        public virtual void btnOrdersClicked(object sender, EventArgs args)
        {
            ms.service.Authorize(autentication, "http://localhost:54637/default.aspx");

            gridOrders grillaOrdenes = (gridOrders)LoadControl("~/gridOrders.ascx");
            grillaOrdenes.ordenes = ms.getOrders(clientID);
            resultsPlaceHolder.Controls.Add(grillaOrdenes);
        }
	}
}

