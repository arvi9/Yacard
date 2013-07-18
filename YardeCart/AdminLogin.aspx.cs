using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Data;

namespace YardeCart
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfoBll userInfoBll = new UserInfoBll(); ;
            int intErr = 0;

            try
            {
                int adminId = userInfoBll.ValidateAdmin(UserName.Text.Trim(), Password.Text.Trim());
                if (string.IsNullOrEmpty(adminId.ToString().Trim()))
                {
                    intErr = 1;
                    lblError.Text = "Invalid Adminname and Password! Please try again.";
                    lblError.Visible = false;
                }
                else
                {
                    Session.Abandon();
                    Session.RemoveAll();

                    if (Session["AdminID"] == null)
                        Session.Add("AdminID", adminId.ToString());
                    //if (chkRememberMeSet == true)
                    {
                        Response.Cookies.Clear();
                        HttpCookie cadminId = new HttpCookie("AdminID", adminId.ToString().Trim());
                        cadminId.Expires = DateTime.Now.AddDays(5);

                        Response.Cookies.Add(cadminId);
                    }
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
            }
            catch (Exception ex)
            {
                FailureText.Text = ex.Message.ToString();

                intErr = 1;
                lblError.Text = ex.Message.ToString();
                lblError.Visible = false;
            }

            if (intErr == 0)
                Response.Redirect("Default.aspx");
        }

    }
}