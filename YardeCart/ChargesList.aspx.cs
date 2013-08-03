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
    public partial class ChargesList : System.Web.UI.Page
    {
        DataTable dt = null;
        ChargeDetails objCharge = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadChargeDetails();
            }
        }

        void LoadChargeDetails()
        {
            objCharge = new ChargeDetails();
            dt = objCharge.SelectChargeDetails();
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtAmount.Text != "")
            {
                objCharge = new ChargeDetails();
                int r = objCharge.CreateChargeDetails(0,
                    Convert.ToInt32(Session["UserId"].ToString()),
                    txtName.Text.ToString().Trim(),
                    int.Parse(RadioButtonList1.SelectedItem.Value.ToString().Trim()),
                    Convert.ToDouble(txtAmount.Text));
                txtName.Text = "";
                txtAmount.Text = "";
                RadioButtonList1.SelectedIndex = 0;
                LoadChargeDetails();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtAmount.Text = "";
            RadioButtonList1.SelectedIndex = 0;

        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            objCharge = new ChargeDetails();
            int catId = (int)DataList1.DataKeys[(int)e.Item.ItemIndex];

            objCharge.ChargeDetailsDelete(catId);

            DataList1.EditItemIndex = -1;
            LoadChargeDetails();
        }
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            LoadChargeDetails();
        }
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            DropDownList ddlCat = (DropDownList)e.Item.FindControl("ddlCat");
            //LoadCategoryGroup(ddlCat);
            //for (int i = 0; i < ddlCat.Items.Count; i++)
            //{
            //    if (ddlCat.Items[i].Text == e.Item.Attributes["CategoryGroupName"])
            //        ddlCat.SelectedIndex = i;
            //}

            LoadChargeDetails();
        }
        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            // Get the DataKey value associated with current Item Index.
            int catId = (int)DataList1.DataKeys[(int)e.Item.ItemIndex];
            // Get updated value entered by user in textbox control for   
            // Name field.
            TextBox txtId;
            txtId = (TextBox)e.Item.FindControl("txtId");
            TextBox txtCName;
            txtCName = (TextBox)e.Item.FindControl("txtCName");
            //DropDownList ddlCType = (DropDownList)e.Item.FindControl("ddlCType");
            //ddlCType.Items.Add(new ListItem("Amount", "0"));
            //ddlCType.Items.Add(new ListItem("Percentage", "1"));
            RadioButtonList RDO = (RadioButtonList)e.Item.FindControl("RadioButtonList1");
            TextBox txtCAmount;
            txtCAmount = (TextBox)e.Item.FindControl("txtCAmount");
            
            // string variable to store the connection string
            // retrieved from the connectionStrings section of web.config
            objCharge = new ChargeDetails();
            int r = objCharge.CreateChargeDetails(
                Convert.ToInt32(txtId.Text.ToString().Trim()),
                Convert.ToInt32(Session["UserId"].ToString()),
                txtCName.Text.ToString().Trim(),
                Convert.ToInt32(RDO.SelectedItem.Value.ToString()),
                Convert.ToDouble(txtCAmount.Text));
            // reset the DataList mode back to its initial state  
            DataList1.EditItemIndex = -1;
            LoadChargeDetails();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
        }

    }
}