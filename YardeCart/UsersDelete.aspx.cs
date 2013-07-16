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
    public partial class UsersDelete : System.Web.UI.Page
    {
        UserInfoBll objUser = null;
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();

                btnBlock.Attributes.Add("onclick",
         "return confirm('Are you sure you want to delete selected User(s) ?');");
            }
        }

        void LoadUsers()
        {
            objUser = new UserInfoBll();
            dt = objUser.SelectAllProfile();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnBlock_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                int intBlockVal = 0;
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDelStatus");
                if (chk.Checked)
                {
                    intBlockVal = 1;
                }

                string sUserId = GridView1.DataKeys[r.RowIndex].Value.ToString();

                objUser = new UserInfoBll();
                objUser.UpdateUserDeleteStatus(Convert.ToInt32(sUserId), intBlockVal);
            }
        }

        protected void btnCheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDelStatus");
                chk.Checked = true;
            }
        }

        protected void btnUncheckAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.Cells[0].FindControl("chkDelStatus");
                chk.Checked = false;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadUsers();
        }
    }
}