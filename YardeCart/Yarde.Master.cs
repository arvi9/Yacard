using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Common;

namespace YardeCart
{
    public partial class Yarde : MasterPage
    {
        public string isShowHideControl = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                if (Session["UserId"] == null)
                {
                    if (this.Page.Title.Contains("Activa") == false)
                    Session.Add("UserId", Request.QueryString["uid"].ToString());
                }
            }
            else if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null && Request.Cookies["UserId"] != null)
            {
                Session.Add("UserId", Request.Cookies["UserId"].Value.ToString());
            }

            if (Session["UserId"] == null)
            {
                    welcomeMessage.InnerText = "Welcome Guest";
                }
                else
                {
                    UserInfoBll usr = new UserInfoBll();
                    DataTable dt = usr.SelectProfile(Convert.ToInt32(Session["UserId"].ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        welcomeMessage.InnerText = "Welcome " + dt.Rows[0]["UserName"].ToString();
                    }
                }
          
            if (welcomeMessage.InnerText.Contains("Guest") || string.IsNullOrWhiteSpace(welcomeMessage.InnerText))
            {
                isShowHideControl = "True";
            }
            else
            {
                isShowHideControl = "False";

            }
        }
    }
}