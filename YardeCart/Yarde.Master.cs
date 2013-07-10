using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using YardeCart.Business;

namespace YardeCart
{
    public partial class Yarde : MasterPage
    {
        public string isShowHideControl = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = this.Page.Title.ToString();
            lblUsername.Visible = false;
            if (s.Contains("Register") != true && s.Contains("Log") != true)
            {
                if (Session["UserId"] == null)
                {
                    //lblUsername.Text = "Welcome Guest";
                    welcomeMessage.InnerText = "Welcome Guest";
                }
                else
                {
                    //lblUsername.Visible = true;
                    UserInfoBll usr = new UserInfoBll();
                    DataTable dt = usr.SelectProfile(Convert.ToInt32(Session["UserId"].ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        welcomeMessage.InnerText = "Welcome " + dt.Rows[0]["UserName"].ToString();
                        //lblUsername.Text = "Welcome " + dt.Rows[0]["UserName"].ToString();
                    }
                }
            }
            else
            {

                //lblUsername.Visible = false;
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