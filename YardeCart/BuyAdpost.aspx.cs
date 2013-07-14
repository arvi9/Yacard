using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.IO;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YardeCart.Business;
using YardeCart.Common;

namespace YardeCart
{
    public partial class BuyAdpost : System.Web.UI.Page
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

            LoadImage();
        }

        private void LoadImage()
            {
            try
            {
                AdDetailsBll adbll = new AdDetailsBll();
                DataTable dt = adbll.GetAdDetails(Convert.ToInt32(strAdId), Convert.ToInt32(strUserId));

                if (dt.Rows.Count > 0)
                {
                    lblCategory.Text = dt.Rows[0]["CategoryName"].ToString();
                    lblTitle.Text = dt.Rows[0]["AdPostTitle"].ToString();
                    lblAddesc.Text = dt.Rows[0]["Description"].ToString();
                    lblPrice.Text = "Price : $" + dt.Rows[0]["Price"].ToString();
                    strImgpath = dt.Rows[0]["ImagePath"].ToString().Split(':');
                    strVideolink = dt.Rows[0]["VideoLink"].ToString();
                }
                string appPath = ConfigurationManager.AppSettings["ApplicationPath"].ToString().Trim();

                string divSlider = @"<ul class='slides'>";
                string fileSlide = string.Empty;

                for (int i = 0; i < strImgpath.Length;i++ )
                {
                    fileSlide = @"<li><img src='";

                    //appPath = appPath+strImgpath[i];
                    fileSlide += appPath + strImgpath[i] + "' /></li>";

                    divSlider += fileSlide;
                    break;
                }

                divImageSlider.InnerHtml = divSlider + "</ul>";
                spnVideo.InnerHtml = BindUrl(strVideolink);

            }
            catch (Exception ex)
            {
                //ShowErrorMsg("error", ex.Message);
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
                Response.Redirect("Login.aspx");
            else
                Response.Redirect("BuyAdslist.aspx");
        }

        public static string SiteBaseUrl
        {
            get
            {
                //return ConfigurationManager.AppSettings["RootPath"].ToString(); 
                string orginalUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                if (HttpContext.Current.Request.Url.Query.Length > 0)
                    orginalUrl = orginalUrl.Replace(HttpContext.Current.Request.Url.Query, string.Empty);

                return orginalUrl.Replace(HttpContext.Current.Request.Url.AbsolutePath, string.Empty) + ((HttpContext.Current.Request.ApplicationPath == "/" ? "" : HttpContext.Current.Request.ApplicationPath)) + '/';
            }

        }

    }
}