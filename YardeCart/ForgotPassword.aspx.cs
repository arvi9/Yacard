using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Common;
using YardeCart.Entity;

namespace YardeCart
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.SelectUserByEmail(txtEmail.Text.Trim());

            if (dt.Rows.Count > 0)
            {
                string strUserId = dt.Rows[0]["UserID"].ToString();
                string strUsername = dt.Rows[0]["UserName"].ToString();
                string strPassword = dt.Rows[0]["UserPassword"].ToString();

                string mUname = ConfigurationManager.AppSettings["mailUsername"].ToString();
                string mPwd = ConfigurationManager.AppSettings["mailPassword"].ToString();
                string mFrom = "";
                string mTo = txtEmail.Text.Trim();
                string mCC = "";
                string mSubject = "Yard E-Cart Password request";
                string serverPath = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/Login.aspx";
                string activatePath = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/ActivateUser.aspx?uid=" + UtilityClass.Encrypt(strUserId.ToString()).ToString();

                string mMsg = "";

                if (dt.Rows[0]["UserStatus"].ToString() == "0")
                {
                    mMsg = "<html><body><form id='form1' runat='server'><div>" +
                    "Dear " + strUsername + ",<br /><br />As you request, your username and password is given below:<br><br>" +
                    "<b>UserName : " + strUsername + "<br>Password : " + strPassword + "</b>" +
                    "<br /><br />Before we can activate your account one last step must be taken to complete your registration." +
                    "<br /><br />Please note - you must complete this last step to become a registered member. You will only need to visit this URL once to activate your account." +
                    "<br /><br />To complete your registration, please visit this URL:<br />" +
                    "<a href='" + activatePath + "' runat='server' >" + activatePath + "</a>" +
                    "<br /><br />Now you can login with Yard E-Cart<br />" +
                    "<a href='" + serverPath + "' runat='server' >" + serverPath + "</a>" +
                    "<br /><br /><br /><br />All the best,<br />Yard E-Cart.</div></form></body></html>";
                }
                else
                {
                    mMsg = "<html><body><form id='form1' runat='server'><div>" +
                    "Dear " + strUsername + ",<br /><br />As you request, your username and password is given below:<br><br>" +
                    "<b>UserName : " + strUsername + "<br>Password : " + strPassword + "</b>" +
                    "<br /><br />Now you can login with Yard E-Cart<br />" +
                    "<a href='" + serverPath + "' runat='server' >" + serverPath + "</a>" +
                    "<br /><br /><br /><br />All the best,<br />Yard E-Cart.</div></form></body></html>";

                }
                UtilityClass.SendMail(mUname, mPwd, mFrom, mTo, mCC, mSubject, mMsg, true);

                tblMessage.InnerText = "User Name and Password are sending to " + txtEmail.Text.Trim() + ". Check your mail..";
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please enter your correct E-mail address.";
            }
        }
    }
}