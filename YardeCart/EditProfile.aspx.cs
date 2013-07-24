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
    public partial class EditProfile : System.Web.UI.Page
    {
        public static string strUsername = "";
        public static string strPassword = "";
        public static string strEmail = "";
        int intMailAvail = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Session.Add("UserId", Request.Cookies["UserId"].Value.ToString());

            if (!IsPostBack)
            {
                LoadCountry();
                LoadState();
                LoadCity();
                LoadUserInfo();
            }
        }

        void LoadUserInfo()
        {
            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.SelectProfile(Convert.ToInt32(Session["UserId"].ToString()));
            if (dt.Rows.Count > 0)
            {
                strUsername = dt.Rows[0]["UserName"].ToString();
                strPassword = dt.Rows[0]["UserPassword"].ToString();
                hdnPassword.Value = strPassword;
                txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txtLastName.Text=dt.Rows[0]["LastName"].ToString();
                RadioButtonList1.SelectedValue = dt.Rows[0]["Gender"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                strEmail = dt.Rows[0]["Email"].ToString();
                txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtStreetname.Text = dt.Rows[0]["StreetName"].ToString();
                ddlCountry.Text = dt.Rows[0]["CountryName"].ToString();
                for (int i = 0; i < ddlCountry.Items.Count; i++)
                {
                    if (ddlCountry.Items[i].Text == dt.Rows[0]["CountryName"].ToString())
                        ddlCountry.SelectedIndex = i;
                }
                for (int i = 0; i < ddlCity.Items.Count; i++)
                {
                    if (ddlCity.Items[i].Text == dt.Rows[0]["CityName"].ToString())
                        ddlCity.SelectedIndex = i;
                }
                for (int i = 0; i < ddlState.Items.Count; i++)
                {
                    if (ddlState.Items[i].Text == dt.Rows[0]["StateName"].ToString())
                        ddlState.SelectedIndex = i;
                }
                txtZipcode.Text = dt.Rows[0]["ZipCode"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int intErrorCount = 0;

            if (strEmail != txtEmail.Text.Trim())
            {
                MailCheck(txtEmail.Text.Trim());

                if (intMailAvail == 1)
                {
                    intErrorCount++;
                    lblErrorEmail.Visible = true;
                }
                else
                    lblErrorEmail.Visible = false;
            }
            if (intErrorCount == 0)
            {
                UserInfoBll userBll = new UserInfoBll();
                UserProfile userProfile = new UserProfile();

                try
                {

                    userProfile.UserId = Convert.ToInt32(Session["UserId"].ToString());
                    userProfile.UserName = strUsername;
                    if (txtNewpwd.Text.Trim() != "")
                        userProfile.UserPassword = txtNewpwd.Text;
                    else
                        userProfile.UserPassword = strPassword;

                    userProfile.FirstName = txtFirstName.Text.ToString().Trim();
                    userProfile.LastName = txtLastName.Text.ToString().Trim();
                    userProfile.Email = txtEmail.Text.ToString().Trim();
                    userProfile.Address = txtAddress.Text.ToString().Trim();
                    userProfile.Mobile = txtMobile.Text.ToString().Trim();
                    userProfile.StreetName = txtStreetname.Text.ToString().Trim();
                    userProfile.CityId = Convert.ToInt32(ddlCity.SelectedItem.Value.ToString().Trim());
                    userProfile.StateId = Convert.ToInt32(ddlState.SelectedItem.Value.ToString().Trim());
                    userProfile.ZipCode = txtZipcode.Text.ToString().Trim();
                    userProfile.CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value.ToString().Trim());
                    userProfile.Gender = int.Parse(RadioButtonList1.SelectedItem.Value.ToString().Trim());

                    if (intErrorCount == 0)
                    {
                        int x = userBll.CreateUserInfo(userProfile);
                        //HttpContext.Current.Session.Add("UserId", x);

                        //SendMailtoUser(x);
                        Response.Redirect("MyProfile.aspx");
                    }

                }
                catch (System.Threading.ThreadAbortException th)
                {

                }
                catch (Exception ex)
                {
                }
            }
        }

        #region .. LOAD COMBO BOX ..

        void LoadCountry()
        {
            Country cnt = new Country();
            ddlCountry.Items.Clear();
            DataTable dt1 = cnt.SelectCountry();
            ListItem listItem = new ListItem();
            listItem.Text = "<Select Country>";
            listItem.Value = "0";
            //listItem.Attributes.Add("style", "background-Black:white;color:White");
            ddlCountry.Items.Add(listItem);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                listItem = new ListItem();
                listItem.Text = dt1.Rows[i]["CountryName"].ToString();
                listItem.Value = dt1.Rows[i]["CountryId"].ToString();
                //listItem.Attributes.Add("style", "background-color:Black;color:white");
                ddlCountry.Items.Add(listItem);
            }
            //ddlCountry.SelectedIndex = 0;
        }

        void LoadCity()
        {
            City cnt = new City();
            ddlCity.Items.Clear();
            DataTable dt1 = cnt.SelectCity();
            ListItem listItem = new ListItem();
            listItem.Text = "<Select City>";
            listItem.Value = "0";
            //listItem.Attributes.Add("style", "background-Black:white;color:White");
            ddlCity.Items.Add(listItem);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                listItem = new ListItem();
                listItem.Text = dt1.Rows[i]["CityName"].ToString();
                listItem.Value = dt1.Rows[i]["CityId"].ToString();
                //listItem.Attributes.Add("style", "background-color:Black;color:white");
                ddlCity.Items.Add(listItem);
            }
            //ddlCountry.SelectedIndex = 0;
        }

        void LoadState()
        {
            State cnt = new State();
            ddlState.Items.Clear();
            DataTable dt1 = cnt.SelectState();
            ListItem listItem = new ListItem();
            listItem.Text = "<Select State>";
            listItem.Value = "0";
            //liddlCountrystItem.Attributes.Add("style", "background-Black:white;color:White");
            ddlState.Items.Add(listItem);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                listItem = new ListItem();
                listItem.Text = dt1.Rows[i]["StateName"].ToString();
                listItem.Value = dt1.Rows[i]["StateId"].ToString();
                //listItem.Attributes.Add("style", "background-color:Black;color:white");
                ddlState.Items.Add(listItem);
            }
            //ddlCountry.SelectedIndex = 0;
        }

        #endregion

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }

        void MailCheck(string strEmailAddr)
        {

            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.AvailableMail(strEmailAddr.Trim());
            
            if (dt.Rows.Count == 0)
            {
                intMailAvail = 0;
            }
            else
            {
                intMailAvail = 1;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //int intPwdError = 0;
            //if (txtOldpwd.Text.Trim() != "" && txtOldpwd.Text.Trim() !=strPassword)
            //{
            //    lblPwdError.Visible = true;
            //    lblPwdError.InnerText = "Enter correct old password";
            //    intPwdError++;
            //}
            //if (txtNewpwd.Text.Trim() != "" && txtNewpwd.Text.Trim() != txtConpwd.Text.Trim())
            //{
            //    intPwdError++;
            //    lblPwdError.Visible = true;
            //    lblPwdError.InnerText = "Enter confirm password as above";
            //}

            //if (intPwdError == 0)
            //    lblPwdError.Visible = false;
        }

    }
}