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
    public partial class AdsBlock : System.Web.UI.Page
    {
        AdDetailsBll objAd = null;
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAds();

                btnBlock.Attributes.Add("onclick",
         "return confirm('Are you sure you want to block selected Ad(s) ?');");
            }
        }

        void LoadAds()
        {
            objAd = new AdDetailsBll();
            dt = objAd.GetAllAdDetails();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnBlock_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                int intBlockVal = 0;
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkBlockStatus");
                if (chk.Checked)
                {
                    intBlockVal = 1;
                }

                string sAdId = GridView1.DataKeys[r.RowIndex].Value.ToString();

                objAd = new AdDetailsBll();
                objAd.UpdateAdBlockStatus(Convert.ToInt32(sAdId), intBlockVal);
            }
        }

        protected void btnCheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkBlockStatus");
                chk.Checked = true;
            }
        }

        protected void btnUncheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkBlockStatus");
                chk.Checked = false;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadAds();
        }
    }
}