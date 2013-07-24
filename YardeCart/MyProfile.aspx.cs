using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using YardeCart.Business;
using YardeCart.Common;
using YardeCart.Entity;

namespace YardeCart
{
    public partial class MyProfile : System.Web.UI.Page
    {
        string strUserid = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Session.Add("UserId", Request.Cookies["UserId"].Value.ToString());

            LoadUserInfo();
        }

        void LoadUserInfo()
        {
            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.SelectProfile(Convert.ToInt32(Session["UserId"].ToString()));
            if (dt.Rows.Count > 0)
            {
                lblName.Text = dt.Rows[0]["FirstName"].ToString() + " "+dt.Rows[0]["LastName"].ToString();
                if (dt.Rows[0]["Gender"].ToString() == "1")
                    lblGender.Text = "Male";
                else if (dt.Rows[0]["Gender"].ToString() == "2")
                    lblGender.Text = "Female";
                else if (dt.Rows[0]["Gender"].ToString() == "0")
                    lblGender.Text = "Rather not say";
                lblEmail.Text = dt.Rows[0]["Email"].ToString();
                lblMobile.Text = dt.Rows[0]["Mobile"].ToString();
                lblAddress.Text = dt.Rows[0]["Address"].ToString();
                lblStreetname.Text = dt.Rows[0]["StreetName"].ToString();
                lblCountry.Text = dt.Rows[0]["CountryName"].ToString();
                lblCity.Text = dt.Rows[0]["CityName"].ToString();
                lblState.Text = dt.Rows[0]["StateName"].ToString();
                lblZipcode.Text = dt.Rows[0]["ZipCode"].ToString();
            }
        }

        protected void lnkEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

    }
}