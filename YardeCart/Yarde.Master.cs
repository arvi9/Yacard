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
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = this.Page.Title.ToString();
            if (s.Contains("Register") != true && s.Contains("Log") != true)
            {
                if (Session["UserId"] == null)
                {
                    lblUsername.Text = "Welcome Guest";
                }
                else
                {
                    lblUsername.Visible = true;
                    UserInfoBll usr = new UserInfoBll();
                    DataTable dt = usr.SelectProfile(Convert.ToInt32(Session["UserId"].ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        lblUsername.Text = "Welcome " + dt.Rows[0]["UserName"].ToString();
                    }
                }
            }
            else
                lblUsername.Visible = false;
        }
    }
}