using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MercadoLibre.SDK;
using RestSharp;

namespace MeliSample
{
    public partial class login : System.Web.UI.Page
    {
        private MeliService ms;
        //public string secret_key = "kVDEhEwtNkByjnONdLvfMlC90tno1LsR";
        //public long appID = 4704572964736151;

        protected void Page_Load(object sender, EventArgs e)
        {
            ms = MeliService.GetService();
        }

        protected void LoginClicked(object sender, EventArgs e)
        {
            try
            {
                //Meli m = new Meli(appID, secret_key);
                string redirectUrl = ms.service.GetAuthUrl("http://localhost:54637/default.aspx");
                Response.Redirect(redirectUrl);

            }
            catch (AuthorizationException ex)
            {
                string error = ex.Message;
            }
            //string redirectUrl = ms.Authorize();
            //Response.Redirect(redirectUrl);

        }
    }
}