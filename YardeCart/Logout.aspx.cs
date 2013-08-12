using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace YardeCart
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ad = 0;
            if (Session["UserType"] != null && Session["UserType"].ToString() == "2")
                ad = 1;
            
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            HttpCookie aCookie;
            string cookieName;
            int limit = Request.Cookies.Count;
            for (int i = 0; i < limit; i++)
            {
                cookieName = Request.Cookies[i].Name;
                aCookie = new HttpCookie(cookieName);
                aCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(aCookie);
            }
            FormsAuthentication.SignOut();
            if(ad==1)
                Response.Redirect("AdminLogin.aspx");        
            else
            Response.Redirect("Login.aspx");

        }
    }
}