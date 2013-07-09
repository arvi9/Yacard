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
    public partial class ViewPostedAd : System.Web.UI.Page
    {
        public string[] strImgpath = new string[5];
        DataTable dt = null;
        public static int gridpageIndex=0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadAdDetails();
            BindAlbumGrid();
        }

        //void LoadAdDetails()
        //{
        //    AdDetailsBll adbll = new AdDetailsBll();
        //    DataTable dt = adbll.GetAllAdDetails();
        //    string imageUrl = "", strPrice = "", strCategory = "", strTitle = "", strViewlink="";
        //    string strInnerhtmlContent = "";
        //    if (dt.Rows.Count > 0)
        //    {

        //        for (int intCnt = 0; intCnt < dt.Rows.Count; intCnt++)
        //        {
        //            strCategory = dt.Rows[intCnt]["CategoryName"].ToString();
        //            strTitle = dt.Rows[intCnt]["AdPostTitle"].ToString();
        //            strPrice = "Price : $" + dt.Rows[intCnt]["Price"].ToString();
        //            strImgpath = dt.Rows[intCnt]["ImagePath"].ToString().Split(':');

        //            string appPath = ConfigurationManager.AppSettings["ApplicationPath"].ToString().Trim();
        //            imageUrl = appPath + strImgpath[0];

        //            strViewlink = appPath + "/Account/ViewAds.aspx?aid=" + dt.Rows[intCnt]["AdPostId"].ToString() + "&uid=" + dt.Rows[intCnt]["UserId"].ToString();

        //            strInnerhtmlContent = strInnerhtmlContent + string.Format(
        //            //sid.InnerHtml = sid.InnerHtml + string.Format(
        //            "<div id='ps-albums'>" +

        //            "<div class='ps-album' style='opacity:0;'> <img src='{0}' height />" +
        //            "<div class='ps-desc'>" +
        //              "<div class='ps-head'>" +
        //                "<h3>{1}</h3>" +
        //              "</div>" +
        //              "<div class='ps-cont'> <span>Category on {2} <br><br>  {3} <a href='{4}'>View</a></span> </div>" +
        //            "</div>" +
        //            "</div>" +
        //          "</div>", imageUrl, strTitle, strCategory, strPrice, strViewlink);
        //        }
        //    }
        //    //sid.InnerHtml = strInnerhtmlContent;

              


        //}

        void BindAlbumGrid()
        {
            int k = GridView1.PageCount;
            gridpageIndex = 0;
            AdDetailsBll adbll = new AdDetailsBll();
             dt = adbll.GetAllAdDetails();
            if (dt.Rows.Count > 4)
            {
                decimal dPageSize = (dt.Rows.Count / 4M);
                GridView1.PagerSettings.PageButtonCount = Convert.ToInt32(Math.Floor(dPageSize));
                //GridView1.PageSize = Convert.ToInt32(Math.Ceiling(dPageSize));
            }
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }

        string BindUrl(string title, string desc, string category, string ipath, string aid, string userid, string price)
        {
            int intNoPhotoInd = 0;
            string strNoPhotoPath = "";
            strImgpath=ipath.Split(':');   

            string path = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + strImgpath[0];
            string strViewlink = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/Account/ViewAds.aspx?aid=" +aid + "&uid=" + userid;


            string htmlSText = @"<table>
<tr><td><a title='{0}' href='{3}' ><IMG SRC='{3}' height='300px' width='200px' bordor='2' ></td></tr>
<tr><td style='font-family: Britannic Bold; font-size: large; color: #CB5091; font-weight: bold;'><h3>{0}<h3></br><span>{4}</span></td></tr>" +
                                "<tr><td style='font-family: Britannic Bold; font-size: large; color: #00CC00;'>{2}</td></tr><tr><td><a href='{5}' style='animation:alternate-reverse;font-family: Arial; font-size: medium; font-weight: bold; color: #3333FF;'>BUY</a></br><a href='{5}'>Details</a></td></tr></table>";

            string sTestHtml = string.Empty;
            sTestHtml = string.Format(htmlSText, title, desc, category, strImgpath[0], price, strViewlink);

            //string sTestHtml = string.Empty;
            //    sTestHtml = string.Format(
            //       "<div id='ps-albums'>" +

            //        "<div class='ps-album' style='opacity:0;'> <img src='{0}' height />" +
            //        "<div class='ps-desc'>" +
            //          "<div class='ps-head'>" +
            //            "<h3>{1}</h3>" +
            //          "</div>" +
            //          "<div class='ps-cont'> <span>Category on {2} <br><br>  {3} <a href='{3}'>View</a></span> </div>" +
            //        "</div>" +
            //        "</div>" +
            //      "</div>", title, desc, category, strImgpath[0]);
            return sTestHtml;
        }

        int iRow = 0;
        int x = 0;
        int y = 0;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            x = e.Row.RowIndex;
            if (x < 0)
            {
                y = 0;
            }

            if (x >= 0 & x <= dt.Rows.Count)
            {
                for (int j = 0; j < 4; j++)
                {
                    if (dt.Rows.Count == gridpageIndex)
                        return;

                    HtmlGenericControl spnHtml = (HtmlGenericControl)e.Row.FindControl("spnHtml" + j.ToString());
                    if (spnHtml == null)
                        return;
                    string sAdPostTitle = dt.Rows[gridpageIndex]["AdPostTitle"].ToString().Trim();
                    string sDescription = dt.Rows[gridpageIndex]["Description"].ToString().Trim();
                    string sCategoryName = dt.Rows[gridpageIndex]["CategoryName"].ToString().Trim();
                    string sPrice ="Price : $"+ dt.Rows[gridpageIndex]["Price"].ToString().Trim();
                    string sImagePath = dt.Rows[gridpageIndex]["ImagePath"].ToString().Trim();
                    string sAdPostId = dt.Rows[gridpageIndex]["AdPostId"].ToString().Trim();
                    string sUserId = dt.Rows[gridpageIndex]["UserId"].ToString().Trim();

                    spnHtml.InnerHtml = BindUrl(sAdPostTitle, sDescription, sCategoryName, sImagePath, sAdPostId, sUserId, sPrice);
                    y++;
                    gridpageIndex++;
                    if (dt.Rows.Count == gridpageIndex)
                        return;

                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //BindAlbumGrid();
           int i= GridView1.PageIndex;
        }

    }
}