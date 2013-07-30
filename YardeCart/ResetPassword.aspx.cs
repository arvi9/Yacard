using System;
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
    public partial class ResetPassword : System.Web.UI.Page
    {
        string strUserId = ""; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string sUid = Request.QueryString["uid"].ToString();
                sUid = sUid.Replace(" ", "+");
                strUserId = Convert.ToInt32(UtilityClass.Decrypt(sUid)).ToString();
                lblError.Visible = false;
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (txtNewPwd.Text.Trim() != "" && txtNewPwd.Text.Trim() == txtConPwd.Text.Trim())
            {
                UserInfoBll usrBll = new UserInfoBll();
                usrBll.UpdateUserPassword(Convert.ToInt32(strUserId), txtNewPwd.Text.Trim());
                tblMessage.InnerText = "Your Password has changed. Check your login..";
                lblError.Visible = false;
                txtConPwd.Text = ""; 
                txtNewPwd.Text = "";
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please enter confirm password as above";
            }
        }

    }
}