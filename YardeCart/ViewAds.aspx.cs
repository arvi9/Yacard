using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Common;

namespace YardeCart
{
    public partial class ViewAds : System.Web.UI.Page
    {
        public string strAdId = "";
        public string strUserId = "";
        public string strVideolink = "";
        public string[] strImgpath = new string[5];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["uid"] != null)
            {
                strUserId = Request.QueryString["uid"].ToString();
            }
            if (Request.QueryString["aid"] != null)
            {
                strAdId = Request.QueryString["aid"].ToString();
            }

            LoadAdDetails();
        }

        void LoadAdDetails()
        {
            AdDetailsBll adbll = new AdDetailsBll();
            DataTable dt = adbll.GetAdDetails(Convert.ToInt32(strAdId), Convert.ToInt32(strUserId));

            if (dt.Rows.Count > 0)
            {
                lblCategory.Text = dt.Rows[0]["CategoryName"].ToString();
                lbllAdtitle.Text = dt.Rows[0]["AdPostTitle"].ToString();
                lblAddesc.Text = dt.Rows[0]["Description"].ToString();
                lblPrice.Text = "Price : $"+dt.Rows[0]["Price"].ToString();
                strImgpath = dt.Rows[0]["ImagePath"].ToString().Split(':');
                strVideolink = dt.Rows[0]["VideoLink"].ToString();

                string appPath = ConfigurationManager.AppSettings["ApplicationPath"].ToString().Trim();
                string imageUrl = appPath + strImgpath[0];
                adimage1.InnerHtml = string.Format(
                    "<a align=center href='{0}'><br/><img  align=center src='{0}' " +
                    "width=350px  height=450px  alt='' border=2 bordorcolor='black'></a>",
                    imageUrl);
                for (int intCnt = 1; strImgpath.Length > intCnt;intCnt++ )
                {
                    imageUrl = appPath + strImgpath[intCnt];
                }

                if (strImgpath.Length >= 2)
                {
                    imageUrl = appPath + strImgpath[1];
                    adimage2.InnerHtml = string.Format(
                                        "<a align=center href='{0}'><br/><img  align=center src='{0}' " +
                                        "width=200px  height=200px  alt='' border=2 bordorcolor='black'></a>",
                                        imageUrl);
                }
                if (strImgpath.Length >= 3)
                {
                    imageUrl = appPath + strImgpath[2];
                    adimage3.InnerHtml = string.Format(
                                        "<a align=center href='{0}'><br/><img  align=center src='{0}' " +
                                        "width=200px  height=200px  alt='' border=2 bordorcolor='black'></a>",
                                        imageUrl);
                }
                if (strImgpath.Length >= 4)
                {
                    imageUrl = appPath + strImgpath[3];
                    adimage4.InnerHtml = string.Format(
                                        "<a align=center href='{0}'><br/><img  align=center src='{0}' " +
                                        "width=200px  height=200px  alt='' border=2 bordorcolor='black'></a>",
                                        imageUrl);
                }
                if (strImgpath.Length == 5)
                {
                    imageUrl = appPath + strImgpath[4];
                    adimage5.InnerHtml = string.Format(
                                        "<a align=center href='{0}'><br/><img  align=center src='{0}' " +
                                        "width=200px  height=200px  alt='' border=2 bordorcolor='black'></a>",
                                        imageUrl);
                }
                spnVideo.InnerHtml = BindUrl(strVideolink);

            }

        }
        
        protected string BindUrl(string filename)
        {
            string htmlSText = "";
            string imageUrl = string.Empty;
            string videoUrl = string.Empty;
            UtilityClass.GetYouTubeURL(filename, out imageUrl, out videoUrl);

            htmlSText = "<object type='application/x-shockwave-flash' data='{0}' width='420' height='340'>" +
            "<param name='movie' value='{0}' />" +
            "<param name='wmode' value='transparent' />" +
            "<embed src='{0}' type='application/x-shockwave-flash' wmode='transparent' allowscriptaccess='always' allowfullscreen='true' width='480'" +
            "height='385'></embed>" +
            "</object>";
            string sTestHtml = string.Format(htmlSText, videoUrl);

            return sTestHtml;
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("BuyAdpost.aspx");
            }
        }

    }
}