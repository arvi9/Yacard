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
                login.UserName = Request.Cookies["Username"].Value.ToString();
                //if (Request.Cookies["Password"] != null)
                    //login.Password = Request.Cookies["Password"].Value.ToString();
                
                login.RememberMeSet = true;
            }   
        }
      
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfoBll userInfoBll = new UserInfoBll();;
            int intErr = 0;

            try
            {
                int userId = userInfoBll.ValidateUser(login.UserName.Trim(), login.Password.Trim());
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

                    Session.Add("IsLoginUser", "true");

                    // Use this line when you want to save a cookie
                    Response.Cookies["TIS"].Value = userId.ToString() + ";" + "true";

                    // How long will cookie exist on client hard disk
                    Response.Cookies["TIS"].Expires = DateTime.Now.AddDays(10);
                    
                    HttpCookie cUserId = new HttpCookie("UserId", userId.ToString().Trim());
                    cUserId.Expires = DateTime.Now.AddDays(5);
                    Response.Cookies.Add(cUserId);

                    if (login.RememberMeSet == true)
                    {
                        //Response.Cookies.Clear();
                        HttpCookie cUsername = new HttpCookie("UserName", login.UserName.ToString().Trim());
                        HttpCookie cPassword = new HttpCookie("Password", login.Password.ToString().Trim());
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
                login.FailureText = ex.Message.ToString();

                intErr = 1;
                lblError.Text = ex.Message.ToString();
                lblError.Visible = false;
            }
        
            if(intErr==0)
            Response.Redirect("Default.aspx?uid="+Session["UserId"].ToString());
        }
    }
}