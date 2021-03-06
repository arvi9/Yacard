﻿using System;
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
        public int gridpageIndex=0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            //LoadAdDetails();
            BindAlbumGrid();
        }
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
            GridView1.Controls.Clear();

            //gridpageIndex = 0;
            AdDetailsBll adbll = new AdDetailsBll();
            if (txtSearch.Text.Trim() == "")
             dt = adbll.GetAllAdDetails();
            else
                dt = adbll.SearchAdsByKeyword(txtSearch.Text.Trim());
            if (dt.Rows.Count > 4)
            {
                decimal dPageSize = (dt.Rows.Count / 4M);
                //GridView1.PagerSettings.PageButtonCount = Convert.ToInt32(Math.Floor(dPageSize));
                //GridView1.PageSize = Convert.ToInt32(Math.Ceiling(dPageSize));
            }
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }

        string BindUrl(string title, string desc, string category, string ipath, string aid, string userid, string price, string AdStatus)
        {
            int intNoPhotoInd = 0;
            string htmlSText = "";
            strImgpath=ipath.Split(':');   
            string sTestHtml = string.Empty;

            string path = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + strImgpath[0];
            string strViewlink = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/ViewAds.aspx?aid=" + aid + "&uid=" + userid;
            string strBuylink = ConfigurationManager.AppSettings["ApplicationPath"].ToString() + "/BuyAdpost.aspx?aid=" + aid + "&uid=" + userid;

            if (AdStatus == "NEW")
            {
                htmlSText = @"<table>
<tr><td colspan='2'><a title='{0}' href='{3}' ><IMG SRC='{3}' width='180px' style='border: thin ridge #C0C0C0;height: 140px' ></td></tr>
<tr><td colspan='2' style=' font-family: Tahoma;font-size: medium; font-weight: bold; color: #800080;height:30px;'>{0}</td></tr>
<tr>
<td style='font-size: small; font-weight: 800; color:green; font-family: Tahoma; text-align: center; vertical-align: middle;'>{4}</td>
<td style='font-size: small; font-weight: 200; color:gray;text-align: right; vertical-align: middle;'>{2}</td>
</tr>
<tr><td ><a href='{6}' style='font-size: medium; font-weight: 800; color:blue;'>Add to Cart</a></td>
<td style='text-align: right' >&nbsp;<a href='{5}' style='font-size: small; font-weight: 100;color:GrayText;'>Details</a></td></tr>
<tr><td>&nbsp;</td></tr></table>";

            sTestHtml = string.Format(htmlSText, title, desc, category, path, price, strViewlink, strBuylink);
            }
            else if (AdStatus == "BOUGHT")
            {
                // style='border: thick groove #660066'
                htmlSText = @"<table>
<tr><td colspan='2'><a title='{0}' href='{3}' ><IMG SRC='{3}' width='180px' style='border: thin ridge #C0C0C0;height: 140px' ></td></tr>
<tr><td colspan='2' style='font-family:Tahoma;font-size: medium; font-weight: bold; color: #800080;height:30px;'>{0}</td></tr>
<tr>
<td style='font-size: small; font-weight: 800; color:green; font-family: Tahoma; text-align: center; vertical-align: middle;'>{4}</td>
<td style='font-size: small; font-weight: 200; color:gray;text-align: right; vertical-align: middle;'>{2}</td>
</tr>
<tr><td style='font-size: large; font-weight: 800; color:chocolate;'>SOLD</td>
<td style='text-align: right' >&nbsp;<a href='{5}' style='font-size: small; font-weight: 100;color:GrayText;'>Details</a></td></tr>
<tr><td>&nbsp;</td></tr></table>";

                sTestHtml = string.Format(htmlSText, title, desc, category, path, price, strViewlink, "");
            }

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
                    string sPrice ="$ "+ dt.Rows[gridpageIndex]["Price"].ToString().Trim();
                    string sImagePath = dt.Rows[gridpageIndex]["ImagePath"].ToString().Trim();
                    string sAdPostId = dt.Rows[gridpageIndex]["AdPostId"].ToString().Trim();
                    string sUserId = dt.Rows[gridpageIndex]["UserId"].ToString().Trim();
                    string sAdStatus = dt.Rows[gridpageIndex]["AdStatus"].ToString().Trim();

                    spnHtml.InnerHtml = BindUrl(sAdPostTitle, sDescription, sCategoryName, sImagePath, sAdPostId, sUserId, sPrice, sAdStatus);
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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindAlbumGrid();

        }

    }
}