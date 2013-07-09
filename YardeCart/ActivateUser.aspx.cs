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
    public partial class ActivateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sUid = Request.QueryString["uid"].ToString();
            sUid = sUid.Replace(" ", "+");
            UserInfoBll usrBll = new UserInfoBll();
            usrBll.UpdateActivation(Convert.ToInt32(UtilityClass.Decrypt(sUid)));

        }
    }
}