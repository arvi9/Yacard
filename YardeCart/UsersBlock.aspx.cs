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
    public partial class UsersBlock : System.Web.UI.Page
    {
        UserInfoBll objUser = null;
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblUser.Visible = false;
                lblMessage.Visible = false;
                lblError.Visible = false;

                btnBlock.Attributes.Add("onclick",
         "return confirm('Are you sure you want to block selected User(s) ?');");
            }
        }

        void LoadUsers()
        {
            objUser = new UserInfoBll();
            if (txtSearch.Text.ToString().Trim()=="")
            dt = objUser.SelectAllProfile();
            else
                dt = objUser.SearchUsers(txtSearch.Text.ToString().Trim());
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt.Rows.Count > 0)
            {
                tblUser.Visible = true;
                lblError.Visible = false;
            }
            else
            {
                tblUser.Visible = false;
                lblError.Visible = true;
                lblError.Text = "No Users";
            }
        }

        protected void btnBlock_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow r in GridView1.Rows)
            {
                int intBlockVal = 0;
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkBlockStatus");
                if (chk.Checked)
                {
                    intBlockVal = 1;
                }

                string sUserId = GridView1.DataKeys[r.RowIndex].Value.ToString();

                objUser = new UserInfoBll();
                objUser.UpdateUserBlockStatus(Convert.ToInt32(sUserId), intBlockVal);

            }

            //lblMessage.Visible = true;
            //lblMessage.Text = "Selected users are blocked";
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
            LoadUsers();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers();
            
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                CheckBox chkBlockStatus = (CheckBox)e.Row.Cells[0].FindControl("chkBlockStatus");
                CheckBox chkBoxSelectDeSelectAll = (CheckBox)this.GridView1.HeaderRow.FindControl("chkBoxSelectDeSelectAll");
                chkBlockStatus.Attributes["onclick"] = string.Format
                                                       (
                                                          "javascript:ChildCheckBoxClick(this,'{0}');",
                                                          chkBoxSelectDeSelectAll.ClientID
                                                       );
            }
        }
    }
}