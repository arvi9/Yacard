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
    public partial class CategoryList : System.Web.UI.Page
    {
        DataTable dt = null;
        Category objCategory = null;
        int PageSize = 50;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadCategory();
            }
        }

        void LoadCategory()
        {
            objCategory = new Category();
            dt = objCategory.SelectCategory();

            if (dt.Rows.Count > 0)
            {
                if (PagingRow.Visible == true)
                {
                    // Setting viewstate for TotalRecords                 

                    LabelTotalRecords.Text = dt.Rows.Count.ToString();

                    // Setting viewstate for TotalPages  

                    if (int.Parse(LabelTotalRecords.Text) % PageSize > 0)

                        // If page size is not exactly divisible by total records  

                        ViewState["TotalPages"] = int.Parse(LabelTotalRecords.Text) / PageSize;

                    else

                        // If page is exactly divisible by total records  

                        ViewState["TotalPages"] = int.Parse(LabelTotalRecords.Text) / PageSize - 1;

                    ViewState["dataTable"] = dt;

                    if (!object.Equals(dt, null))
                    {

                        BindList(ManagePaging(dt));

                    }
                }
                else
                {
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
            }
            else
                PagingRow.Visible = false;
        }

        private void ReloadControl()
        {

            if (!object.Equals(ViewState["dataTable"], null))

                BindList(ManagePaging((DataTable)ViewState["dataTable"]));

        }


        protected void LinkButtonFirst_Click(object sender, EventArgs e)
        {

            CurrentPage = 0;

            ReloadControl();

        }

        protected void LinkButtonPrevious_Click(object sender, EventArgs e)
        {

            CurrentPage -= 1;

            ReloadControl();

        }

        protected void LinkButtonNext_Click(object sender, EventArgs e)
        {

            CurrentPage += 1;

            ReloadControl();

        }

        protected void LinkButtonLast_Click(object sender, EventArgs e)
        {

            CurrentPage = int.Parse(ViewState["TotalPages"].ToString());

            ReloadControl();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            LinkButton lnkbtn = (LinkButton)sender;

            CurrentPage = (int.Parse(lnkbtn.Text) - 1);

            ReloadControl();

        }

        private void BindList(DataTable dataTable)
        {
            DataList1.DataSource = dataTable;
            DataList1.DataBind();
        }



        private void BindList(PagedDataSource pageDataSource)
        {

            DataList1.DataSource = pageDataSource;

            DataList1.DataBind();

            ShowPagingLinks();

        }  
   



        private void ShowPagingLinks()
        {

            if (CurrentPage == int.Parse(ViewState["TotalPages"].ToString()))
            {

                LinkButtonNext.Enabled = false;

                LinkButtonLast.Enabled = false;

            }

            else
            {

                LinkButtonNext.Enabled = true;

                LinkButtonLast.Enabled = true;

            }



            if (CurrentPage == 0)
            {

                LinkButtonPrevious.Enabled = false;

                LinkButtonFirst.Enabled = false;

            }

            else
            {

                LinkButtonPrevious.Enabled = true;

                LinkButtonFirst.Enabled = true;

            }

        }



        private void ShowTotalNumberOfRecords()
        {

            int i, j;

            if (CurrentPage == 0)

                i = 1;

            else

                i = (CurrentPage * PageSize);

            LabelPageFirstRecord.Text = i.ToString();

            if (CurrentPage == int.Parse(ViewState["TotalPages"].ToString()))

                LabelPageLastRecord.Text = LabelTotalRecords.Text;

            else
            {

                j = ((CurrentPage + 1) * PageSize);

                LabelPageLastRecord.Text = j.ToString();

            }

        }  


        private void ShowPageNumbers()
        {

            int startPagenumber, endPageNumber;

            if (CurrentPage < 3)
            {

                startPagenumber = 1;

                endPageNumber = 5;

            }



            else

                if (CurrentPage > (int.Parse(ViewState["TotalPages"].ToString()) - 2))
                {

                    startPagenumber = int.Parse(ViewState["TotalPages"].ToString()) - 3;

                    endPageNumber = int.Parse(ViewState["TotalPages"].ToString()) + 1;

                    if (startPagenumber == 0)
                    {

                        startPagenumber = 1;

                        endPageNumber += 1;

                    }

                }



                else
                {

                    startPagenumber = CurrentPage - 1;

                    endPageNumber = CurrentPage + 3;

                }



            int linkButtonNumber = 1;

            LinkButton lnkbtn;

            for (int k = startPagenumber; k <= endPageNumber; k++)
            {

                lnkbtn = (LinkButton)(tdPageNumbers.FindControl("LinkButton" + linkButtonNumber.ToString()));

                lnkbtn.Text = k.ToString();

                linkButtonNumber++;

            }



            for (int idLoop = 1; idLoop <= 5; idLoop++)
            {

                lnkbtn = (LinkButton)(tdPageNumbers.FindControl("LinkButton" + idLoop.ToString()));

                if (int.Parse(lnkbtn.Text) == (CurrentPage + 1))
                {

                    lnkbtn.Enabled = false;

                    lnkbtn.CssClass = "PagerLinkSelected";

                }

                else
                    if (int.Parse(lnkbtn.Text) > (int.Parse(ViewState["TotalPages"].ToString()) + 1))
                    {

                        lnkbtn.Visible = false;

                    }

                    else
                    {

                        lnkbtn.Enabled = true;

                        lnkbtn.CssClass = "PagerLinkStyle";

                        lnkbtn.BackColor = System.Drawing.Color.Empty;

                    }

            }

        }  



        private PagedDataSource ManagePaging(DataTable dTable)
        {

            PagedDataSource pageDataSource = new PagedDataSource();

            pageDataSource.DataSource = dTable.DefaultView;

            pageDataSource.AllowPaging = true;

            pageDataSource.PageSize = PageSize;

            pageDataSource.CurrentPageIndex = CurrentPage;

            ShowTotalNumberOfRecords();

            ShowPageNumbers();

            return pageDataSource;

        }

        public int CurrentPage
        {

            get
            {

                // look for current page in ViewState  

                object current = this.ViewState["CurrentPage"];

                if (current == null)

                    return 0; // default page index of 0  

                else

                    return (int)current;

            }

            set
            {

                this.ViewState["CurrentPage"] = value;

            }

        }  

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            objCategory = new Category();
            int catId = (int)DataList1.DataKeys[(int)e.Item.ItemIndex];

            objCategory.CategoryDelete(catId);

            DataList1.EditItemIndex = -1;
            LoadCategory();
        }
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            LoadCategory();
        }
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            
            LoadCategory();
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
            
            // string variable to store the connection string
            // retrieved from the connectionStrings section of web.config
            objCategory = new Category();
            int r = objCategory.CategoryUpdate(Convert.ToInt32(txtId.Text.ToString().Trim()), txtCName.Text.ToString().Trim());
            // reset the DataList mode back to its initial state  
            DataList1.EditItemIndex = -1;
            LoadCategory();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            objCategory = new Category();
            int r = objCategory.CategoryUpdate(0, txtName.Text.ToString().Trim());
            txtName.Text = "";
            LoadCategory();
        }
    }
}
