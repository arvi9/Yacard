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

            if (Request.Cookies["Username"] != null)
            {
                UserName.Text = Request.Cookies["Username"].Value.ToString();
                //if (Request.Cookies["Password"] != null)
                    //login.Password = Request.Cookies["Password"].Value.ToString();
                
                RememberMe.Checked = true;
            }   
        }
      
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfoBll userInfoBll = new UserInfoBll();;
            int intErr = 0;

            try
            {
                int userId = userInfoBll.ValidateUser(UserName.Text.Trim(), Password.Text.Trim());
                if (string.IsNullOrEmpty(userId.ToString().Trim()))
                {
                    intErr = 1;
                    lblError.Text = "Invalid Username and Password! Please try again.";
                    lblError.Visible = false;
                }
                else
                {
                    Session.Abandon();
                    Session.RemoveAll();

                    if (Session["UserId"] == null)
                        Session.Add("UserId", userId.ToString());
                    else
                        Session.Add("UserId", userId.ToString());

                    if (Session["UserType"] == null)
                        Session.Add("UserType", "1");
                    Session.Add("IsLoginUser", "true");

                    // Use this line when you want to save a cookie
                    Response.Cookies["TIS"].Value = userId.ToString() + ";" + "true";

                    // How long will cookie exist on client hard disk
                    Response.Cookies["TIS"].Expires = DateTime.Now.AddDays(10);
                    
                    HttpCookie cUserId = new HttpCookie("UserId", userId.ToString().Trim());
                    HttpCookie cUsertype = new HttpCookie("UserType", "1");
                    cUserId.Expires = DateTime.Now.AddDays(5);
                    cUsertype.Expires = DateTime.Now.AddDays(5);
                    Response.Cookies.Add(cUserId);
                    Response.Cookies.Add(cUsertype);

                    if (RememberMe.Checked == true)
                    {
                        //Response.Cookies.Clear();
                        HttpCookie cUsername = new HttpCookie("UserName", UserName.Text.ToString().Trim());
                        HttpCookie cPassword = new HttpCookie("Password", Password.Text.ToString().Trim());
                        cUsername.Expires = DateTime.Now.AddDays(5);
                        cPassword.Expires = DateTime.Now.AddDays(5);

                        Response.Cookies.Add(cUsername);
                        Response.Cookies.Add(cPassword);
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
        
            if(intErr==0)
            Response.Redirect("Default.aspx?uid="+Session["UserId"].ToString());
        }

        protected void lnkForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}