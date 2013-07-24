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
    public partial class AdsDelete : System.Web.UI.Page
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

                btnBlock.Attributes.Add("onclick",
         "return confirm('Are you sure you want to delete selected Ad(s) ?');");
            }
        }

        void LoadAds()
        {
            objAd = new AdDetailsBll();

            if (rdoSearch.SelectedItem.Value.ToString() == "0")
            {
                dt = objAd.SearchAdsByAdtitle(txtSearch.Text.ToString().Trim());    //GetAllAdDetails();
            }
            else
            {
                dt = objAd.SearchAdsByUsername(txtSearch.Text.ToString().Trim());
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
                lblError.Text = "No Ads";
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnBlock_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                int intBlockVal = 0;
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDeleteStatus");
                if (chk.Checked)
                {
                    intBlockVal = 1;
                }

                string sAdId = GridView1.DataKeys[r.RowIndex].Value.ToString();

                objAd = new AdDetailsBll();
                objAd.UpdateAdDeleteStatus(Convert.ToInt32(sAdId), intBlockVal);
            }
            //lblMessage.Visible = true;
            //lblMessage.Text = "Selected Ads are deleted";
        
        }

        protected void btnCheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDeleteStatus");
                chk.Checked = true;
            }
        }

        protected void btnUncheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDeleteStatus");
                chk.Checked = false;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadAds();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadAds();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                CheckBox chkDeleteStatus = (CheckBox)e.Row.Cells[0].FindControl("chkDeleteStatus");
                CheckBox chkBoxSelectDeSelectAll = (CheckBox)this.GridView1.HeaderRow.FindControl("chkBoxSelectDeSelectAll");
                chkDeleteStatus.Attributes["onclick"] = string.Format
                                                       (
                                                          "javascript:ChildCheckBoxClick(this,'{0}');",
                                                          chkBoxSelectDeSelectAll.ClientID
                                                       );
            }
        }

    }
}