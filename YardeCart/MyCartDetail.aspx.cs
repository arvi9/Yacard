using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Common;

namespace YardeCart
{
    public partial class MyCartDetail : System.Web.UI.Page
    {
        public string[] strImgpath = new string[5];
        CartDetails objCart = null;
        DataTable dt = null;
        public int gridpageIndex = 0;
        string strUserId = "";
        public static decimal decTotalPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["uid"] != null)
            {
                Session.Add("UserId", Request.QueryString["uid"].ToString());
                strUserId = Request.QueryString["uid"].ToString();
            }
            if(Request.Cookies["UserId"] != null)
                Session.Add("UserId", Request.Cookies["UserId"].Value.ToString());
            if (!IsPostBack)
            {
                lblError.Visible = false;
                LoadDeliveryType();
                BindAlbumGrid();
            }
        }

        void LoadDeliveryType()
        {
            ChargeDetails cat = new ChargeDetails();
            ddlDeliType.Items.Clear();
            DataTable dt1 = cat.SelectChargeDetails();
            ListItem listItem = new ListItem();
            listItem.Text = "<Select Charge Type>";
            listItem.Value = "0";
            //listItem.Attributes.Add("style", "background-Black:white;color:White");
            ddlDeliType.Items.Add(listItem);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                listItem = new ListItem();
                listItem.Text = dt1.Rows[i]["ChargeName"].ToString();
                listItem.Value = dt1.Rows[i]["ChargeId"].ToString();

                //listItem.Attributes.Add("style", "background-color:Black;color:white");
                ddlDeliType.Items.Add(listItem);
            }
            
        }

        void BindAlbumGrid()
        {
            int k = GridView1.PageCount;
            GridView1.Controls.Clear();

            //gridpageIndex = 0;
            CartDetails cartbll = new CartDetails();
            dt=cartbll.SelectUserCartDetails(Convert.ToInt32(Session["UserId"].ToString()));
            lblCart.Text = dt.Rows.Count.ToString() + " Items in Your Cart";
            if (dt.Rows.Count > 0)
            {
                decTotalPrice = 0;
                tblAdpost.Visible = true;
                tblAmount.Visible = true;
                tblBuy.Visible = true;
            if (dt.Rows.Count > 4)
            {
                decimal dPageSize = (dt.Rows.Count / 4M);
                //GridView1.PagerSettings.PageButtonCount = Convert.ToInt32(Math.Floor(dPageSize));
                //GridView1.PageSize = Convert.ToInt32(Math.Ceiling(dPageSize));
            }
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
            else
            {
                tblAdpost.Visible = false;
                tblAmount.Visible = false;
                tblBuy.Visible = false;
            }
        }

        string BindUrl(string title, string desc, string category, string ipath, string aid, string userid, string price)
        {
            strImgpath = ipath.Split(':');

            string path = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + strImgpath[0];


            string htmlSText = @"<table height='100px' width='500px'>
<tr>
<td><a title='{0}' href='{3}' ><IMG SRC='{3}' width='200px' bordor='2' style='height: 160px' ></td><td>&nbsp;</td>
<td style='font-family: Britannic Bold; color: #00CC00;'>{0}
<h2 class='auto-style2'>{2}<h2><span class='auto-style3'>
<br class='auto-style1'></br></span><span>{4}</span><br/>
</td></tr></table>";

            string sTestHtml = string.Empty;
            sTestHtml = string.Format(htmlSText, title, desc, category, path, price);

            return sTestHtml;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            HtmlGenericControl spnHtml = (HtmlGenericControl)e.Row.FindControl("spnHtml0");
            if (spnHtml == null)
                return;
            string sAdPostTitle = dt.Rows[e.Row.RowIndex]["AdPostTitle"].ToString().Trim();
            string sDescription = dt.Rows[e.Row.RowIndex]["Description"].ToString().Trim();
            string sCategoryName = dt.Rows[e.Row.RowIndex]["CategoryName"].ToString().Trim();
            string sPrice = "Price : $" + dt.Rows[e.Row.RowIndex]["Price"].ToString().Trim();
            string sImagePath = dt.Rows[e.Row.RowIndex]["ImagePath"].ToString().Trim();
            string sAdPostId = dt.Rows[e.Row.RowIndex]["AdPostId"].ToString().Trim();
            string sUserId = dt.Rows[e.Row.RowIndex]["UserId"].ToString().Trim();

            decTotalPrice += Convert.ToDecimal(dt.Rows[e.Row.RowIndex]["Price"].ToString());

            spnHtml.InnerHtml = BindUrl(sAdPostTitle, sDescription, sCategoryName, sImagePath, sAdPostId, sUserId, sPrice);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindAlbumGrid();
        }

        protected void btnKeep_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CartDetails objCart = new CartDetails();
            string sCartId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            objCart.CartDetailDelete(Convert.ToInt32(sCartId));

            BindAlbumGrid();

            if (ddlDeliType.SelectedIndex != 0)
                ddlDeliType_SelectedIndexChanged(sender, e);
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                if (ddlDeliType.SelectedIndex != 0)
                {
                #region .. GET HISTORY ID ..
                int intHistoryId = 0;
                    objCart = new CartDetails();
                DataTable dtMax = objCart.SelectMaxID();
                if (dtMax.Rows.Count > 0)
                {
                    string st = dtMax.Rows[0]["HistroyId"].ToString();
                    if (dtMax.Rows[0]["HistroyId"].ToString() == "")
                        intHistoryId = 0;
                    else
                        intHistoryId = Convert.ToInt32(dtMax.Rows[0]["HistroyId"].ToString());
                }
                intHistoryId++;
                #endregion
                    #region .. BUY DETAILS ..

                DataTable dtCart = objCart.SelectUserCartDetails(Convert.ToInt32(Session["UserId"].ToString()));
                    double delPrice = 0;
                    int intChargeId = int.Parse(ddlDeliType.SelectedItem.Value.ToString().Trim());

                    ChargeDetails chg = new ChargeDetails();
                    DataTable dt = chg.SelectChargeDetailsByID(intChargeId);
                    string strType = "";
                    string strAmount = "";
                    if (dt.Rows.Count > 0)
                    {
                        strType = dt.Rows[0]["ChargeType"].ToString();
                        strAmount = dt.Rows[0]["AmountOrPercent"].ToString();
                    }

                    double dblDeliAmount = Convert.ToDouble(strAmount);
                    if (strType == "0")
                        delPrice = Convert.ToDouble(decTotalPrice) + dblDeliAmount;
                    else if (strType == "1")
                        delPrice = Convert.ToDouble(decTotalPrice) + (Convert.ToDouble(decTotalPrice) * (dblDeliAmount / 100));

                    string strLocationId = "";
                    string strLocationName = "";
                    if (Session["Location"] != null)
                        strLocationName = Session["Location"].ToString();

                    City objCity = new City();
                    DataTable dtCity = objCity.SelectCityByName(strLocationName);
                    if (dtCity.Rows.Count > 0) strLocationId = dtCity.Rows[0]["CityId"].ToString(); else strLocationId = "0";

                for (int i = 0; i < dtCart.Rows.Count; i++)
                {

                    objCart.CreateBuyDetails(
                        Convert.ToInt32(dtCart.Rows[i]["AdPostId"].ToString()),
                        intHistoryId,
                        Convert.ToInt32(Session["UserId"].ToString()),
                            Convert.ToDecimal(delPrice),
                            int.Parse(ddlDeliType.SelectedItem.Value.ToString().Trim()),
                            Convert.ToInt32(strLocationId),
                        "BOUGHT",
                            1,
                            ddlDeliType.SelectedItem.Text.ToString().Trim(),
                            Convert.ToInt32(strType),
                            Convert.ToDouble(strAmount)
                        );


                    objCart.UpdateCartStatus(Convert.ToInt32(dtCart.Rows[i]["AdPostId"].ToString()), Convert.ToInt32(Session["UserId"].ToString()));
                }
                    decTotalPrice = 0;


                #endregion
                Response.Redirect("MyPurchases.aspx");
            }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Select Delivery charges";
                }

            }
        }

        protected void ddlDeliType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDeliType.SelectedIndex != 0)
            {
                objCart = new CartDetails();
                DataTable dtCart = objCart.SelectUserCartDetails(Convert.ToInt32(Session["UserId"].ToString()));
                double delPrice = 0;
                int intChargeId = int.Parse(ddlDeliType.SelectedItem.Value.ToString().Trim());

                ChargeDetails chg = new ChargeDetails();
                DataTable dt = chg.SelectChargeDetailsByID(intChargeId);
                string strType = "";
                string strAmount = "";
                if (dt.Rows.Count > 0)
                {
                    strType = dt.Rows[0]["ChargeType"].ToString();
                    strAmount = dt.Rows[0]["AmountOrPercent"].ToString();
                }

                double dblDeliAmount = Convert.ToDouble(strAmount);
                if (strType == "0")
                    delPrice = Convert.ToDouble(decTotalPrice) + dblDeliAmount;
                else if (strType == "1")
                {
                    dblDeliAmount = (Convert.ToDouble(decTotalPrice) * (dblDeliAmount / 100));
                    delPrice = Convert.ToDouble(decTotalPrice) + dblDeliAmount;
                }
                //decTotalPrice = 0;

                trDeliAmt.Visible = true;
                trTotalAmt.Visible = true;
                lblError.Visible = false;
                lblDeliAmt.Text = "$ " +String.Format("{0:0.00}", dblDeliAmount);
                lblTotalAmt.Text = "$ " + String.Format("{0:0.00}", delPrice);
            }
            else
            {
                trDeliAmt.Visible = false;
                lblError.Visible = true;
                trTotalAmt.Visible = false;
            }
        }

    }
}