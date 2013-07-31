using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using YardeCart.Business;

namespace YardeCart
{
    public partial class AdsReport : System.Web.UI.Page
    {
        AdDetailsBll objAd = null;
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblAdpost.Visible = false;
                lblError.Visible = false;
                lblMessage.Visible = false;
                DatePicker1.TodaysDate = System.DateTime.Today;
                DatePicker2.TodaysDate = System.DateTime.Today;
            }
        }

        void LoadAds()
        {
            objAd = new AdDetailsBll();

            //if (rdoSearch.SelectedItem.Value.ToString() == "0")
            {
                //dt = objAd.SearchAdsByAdtitle(txtSearch.Text.ToString().Trim());    //GetAllAdDetails();
            }
            //else
            {
                dt = objAd.SelectReportsByDate(Convert.ToDateTime(DatePicker1.SelectedDate.ToString()), Convert.ToDateTime(DatePicker2.SelectedDate.ToString()));
            }
            if (dt.Rows.Count > 0)
            {
                tblAdpost.Visible = true;
                lblError.Visible = false;
            }
            else
            {
                tblAdpost.Visible = false;
                lblError.Visible = true;
                lblError.Text = "No Reports";
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadAds();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if ((DatePicker1.SelectedDate.ToString() != "1/1/0001 12:00:00 AM") && (DatePicker2.SelectedDate.ToString() != "1/1/0001 12:00:00 AM"))
                LoadAds();
        }

    }
}