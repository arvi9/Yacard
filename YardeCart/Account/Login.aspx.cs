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
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            RegisterHyperLink.NavigateUrl = "Register.aspx";

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
      
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfoBll userInfoBll = new UserInfoBll();;
            int intErr = 0;

            try
            {
                int userId = userInfoBll.ValidateUser(login.UserName,login.Password);
                if (string.IsNullOrEmpty(userId.ToString().Trim()))
                {
                    intErr = 1;
                    lblError.Text = "Invalid User and Password! Please try again.";
                    lblError.Visible = true;
                }
                else
                {
                    if (Session["UserId"] == null)
                        Session.Add("UserId", userId.ToString());

                    Session.Add("IsLoginUser", "true");

                    // Use this line when you want to save a cookie
                    Response.Cookies["TIS"].Value = userId.ToString() + ";" + "true";

                    // How long will cookie exist on client hard disk
                    Response.Cookies["TIS"].Expires = DateTime.Now.AddDays(10);
                    
                    //if (chkRemember.Checked == true)
                    //{
                    //    HttpCookie cUsername = new HttpCookie("UserName", txtUsername.Text.ToString());
                    //    HttpCookie cPassword = new HttpCookie("Password", txtPassword.Text.ToString());
                    //    cUsername.Expires = DateTime.Now.AddDays(2);
                    //    cPassword.Expires = DateTime.Now.AddDays(2);

                    //    Response.Cookies.Add(cUsername);
                    //    Response.Cookies.Add(cPassword);
                    //}

//                    Response.Redirect("myhome.aspx");
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
            }
            catch (Exception ex)
            {

                intErr = 1;
                lblError.Text = ex.Message.ToString();
                lblError.Visible = true;
            }
        
            if(intErr==0)
            Response.Redirect("~/Default.aspx?uid="+Session["UserId"].ToString());
        }
    }
}