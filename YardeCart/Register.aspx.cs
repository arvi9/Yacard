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
using Microsoft.AspNet.Membership.OpenAuth;
using YardeCart.Business;
using YardeCart.Common;
using YardeCart.Entity;

namespace YardeCart
{
    public partial class Register : Page
    {

        public int intUserAvail = 0;
        int intMailAvail = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;

            if (!IsPostBack)
            {
                LoadCountry();
                LoadState();
                LoadCity();
            }
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            UserInfoBll userBll = new UserInfoBll();
            UserProfile userProfile = new UserProfile();

            try
            {
                string ErrorMsg = "";
                userProfile.UserId = 0;
                userProfile.FirstName = txtFirstname.Text.ToString();
                userProfile.LastName = txtLastname.Text.ToString();
                userProfile.Email = txtEmail.Text.ToString();
                userProfile.UserName = txtUsername.Text.ToString();
                userProfile.UserPasswrod = txtPassword.Text.ToString();
                userProfile.Address = txtAddress.Text.ToString();
                userProfile.Mobile = txtMobile.Text.ToString();
                userProfile.StreetName = txtStreetname.Text.ToString();
                userProfile.CityId = Convert.ToInt32(ddlCity.SelectedItem.Value.ToString());
                userProfile.StateId = Convert.ToInt32(ddlState.SelectedItem.Value.ToString());
                userProfile.ZipCode = txtZipcode.Text.ToString();
                userProfile.CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value.ToString());
                userProfile.Gender = int.Parse(RadioButtonList1.SelectedIndex.ToString());
                ErrorMsg = "Error:";
                int intErrorCount = 0;
                
                UserCheck();

                if (this.intUserAvail == 1)
                    intErrorCount++;

                if (txtPassword.Text != txtRePassword.Text)
                {
                    errPwd.Text = "mismatch";
                    errPwd.Visible = true;
                    intErrorCount++;
                }
                else
                    errPwd.Visible = false;

                if (chkYardecart.Checked == true && intErrorCount == 0)
                {
                    int x = userBll.CreateUserInfo(userProfile);
                    HttpContext.Current.Session.Add("UserId", x);

                    SendMailtoUser(x);
                    Response.Redirect("~/Success.aspx");
                }

            }
            catch (System.Threading.ThreadAbortException th)
            {
                
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UserCheck();
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

        void SendMailtoUser(int UserId)
        {
            try
            {
                string mUname = ConfigurationManager.AppSettings["mailUsername"].ToString();
                string mPwd = ConfigurationManager.AppSettings["mailPassword"].ToString();
                string mFrom = "";
                string mTo = txtEmail.Text.Trim();
                string mCC = "";

                string mSubject = "YardeCart Activation mail";
                string serverPath = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/ActivateUser.aspx?uid=" + UtilityClass.Encrypt(UserId.ToString()).ToString();
                string mMsg = "<html><body><form id='form1' runat='server'><div>" +
                "Dear " + txtUsername.Text.ToString() + ",<br /><br />Thank you for registering at the YardeCart." +
                "Before we can activate your account one last step must be taken to complete your registration." +
                "<br /><br />Please note - you must complete this last step to become a registered member. You will only need to visit this URL once to activate your account." +
                "<br /><br />To complete your registration, please visit this URL:<br />" +
                "<a href='" + serverPath + "' runat='server' >" + serverPath + "</a>" +
                "<br /><br /><br /><br />All the best,<br />YardeCart.</div></form></body></html>";

                UtilityClass.SendMail(mUname, mPwd, mFrom, mTo, mCC, mSubject, mMsg, true);
            }
            catch(SystemException ex)
            {
            }
        }

        #region .. CHECK USERNAME & MAIL ..

        void UserCheck()
        {
            //string sourcepath = "";
            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.AvailableUser(txtUsername.Text.ToString().Trim());
            if (dt.Rows.Count == 0)
            {
                intUserAvail = 0;
                //checkUser.Visible = true;
                imgAvailable.Visible = true;
                imgNotAvailable.Visible = false;
            }
            else
            {
                intUserAvail = 1;
                imgAvailable.Visible = false;
                imgNotAvailable.Visible = true;
            }
        }

        void MailCheck()
        {
            UserInfoBll userBll = new UserInfoBll();
            DataTable dt = userBll.AvailableMail(txtEmail.Text.ToString().Trim());
            if (dt.Rows.Count == 0)
            {
                intMailAvail = 0;
            }
            else
            {
                intMailAvail = 1;
            }
        }

        #endregion

    }
}