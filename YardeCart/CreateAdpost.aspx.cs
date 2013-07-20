using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
//using Microsoft.AspNet.Membership.OpenAuth;
using YardeCart.Business;
using YardeCart.Common;
using YardeCart.Entity;

namespace YardeCart
{
    public partial class CreateAdpost : Page
    {
        private string fileSavePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.DatePicker1.Culture = CultureInfo.GetCultureInfo("en-US");
            this.DatePicker1.SelectedDateChanged += new EventHandler(DatePicker1_DateChanged);

            ErrCategory.Visible = false;
            ErrDate.Visible = false;

            string str = "";
            if (!IsPostBack)
            {
                LoadCategory();
            }

        }

        void DatePicker1_DateChanged(object sender, EventArgs e)
        {
            string s = DatePicker1.SelectedDate.ToString();
        }
    
        #region .. LOAD COMBO BOX ..

        void LoadCategory()
        {
            Category cnt = new Category();
            ddlCategory.Items.Clear();
            DataTable dt1 = cnt.SelectCategory();
            ListItem listItem = new ListItem();
            listItem.Text = "<Select Category>";
            listItem.Value = "0";
            //listItem.Attributes.Add("style", "background-Black:white;color:White");
            ddlCategory.Items.Add(listItem);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                listItem = new ListItem();
                listItem.Text = dt1.Rows[i]["CategoryName"].ToString();
                listItem.Value = dt1.Rows[i]["CategoryId"].ToString();
                //listItem.Attributes.Add("style", "background-color:Black;color:white");
                ddlCategory.Items.Add(listItem);
            }
            //ddlCountry.SelectedIndex = 0;
        }

        #endregion

        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                #region .. VALIDATION ..

                int intError = 0;
                if (DatePicker1.SelectedDate.ToString() == "1/1/0001 12:00:00 AM")
                {
                    intError++;
                    ErrDate.Visible = true;
                    ErrDate.Text = "Select Date";
                }
                if (ddlCategory.SelectedIndex == 0)
                {
                    intError++;
                    ErrCategory.Text = "Select Category";
                    ErrCategory.Visible = true;
                }

                if (FileUpload1.HasFile)
                {
                    if (FileUpload1.PostedFile.ContentLength > 4194304)
                    {
                        errFile1.Visible = true;
                        errFile1.Text = "Exceeds maximum limit 4MB";
                        intError++;
                    }
                    else
                        errFile1.Visible = false;
                }
                if (FileUpload2.HasFile)
                {
                    if (FileUpload2.PostedFile.ContentLength > 4194304)
                    {
                        errFile2.Visible = true;
                        errFile2.Text = "Exceeds maximum limit 4MB";
                        intError++;
                    }
                    else
                        errFile2.Visible = false;
                }
                if (FileUpload3.HasFile)
                {
                    if (FileUpload3.PostedFile.ContentLength > 4194304)
                    {
                        errFile3.Visible = true;
                        errFile3.Text = "Exceeds maximum limit 4MB";
                        intError++;
                    }
                    else
                        errFile3.Visible = false;
                }
                if (FileUpload4.HasFile)
                {
                    if (FileUpload4.PostedFile.ContentLength > 4194304)
                    {
                        errFile4.Visible = true;
                        errFile4.Text = "Exceeds maximum limit 4MB";
                        intError++;
                    }
                    else
                        errFile4.Visible = false;
                }
                if (FileUpload5.HasFile)
                {
                    if (FileUpload5.PostedFile.ContentLength > 4194304)
                    {
                        errFile5.Visible = true;
                        errFile5.Text = "Exceeds maximum limit 4MB";
                        intError++;
                    }
                    else
                        errFile5.Visible = false;
                }
                
                #endregion

                if (intError == 0)
                {
                AdDetailsBll adbll = new AdDetailsBll();

                UserInfoBll usrinfo = new UserInfoBll();
                DataTable dt = usrinfo.SelectProfile(Convert.ToInt32(Session["UserId"].ToString())); // userid
                try
                {

                    #region .. CREATE AD POST ..

                    int intAdpostId = adbll.CreateAdPost(
                        0,
                        txtTitle.Text.ToString(),
                        txtDesc.Text.ToString(),
                        txtKeywords.Text.ToString(),
                        Convert.ToInt32(Session["UserId"].ToString()),
                        Convert.ToInt32(ddlCategory.SelectedItem.Value.ToString()),
                        Convert.ToDecimal(txtPrice.Text.ToString()),
                        Convert.ToInt32(dt.Rows[0]["StateId"].ToString()),
                        Convert.ToInt32(dt.Rows[0]["CityId"].ToString()),
                        Convert.ToInt32(dt.Rows[0]["CountryId"].ToString()),
                        dt.Rows[0]["ZipCode"].ToString(),
                            Convert.ToDateTime(DatePicker1.SelectedDate.ToString()),
                        "NEW",
                        0
                        );

                    #endregion

                    #region .. CREATE AD POST IMAGE ..

                    string path = string.Empty;
                    string strImgFinalPath = "";
                    string finalPath = string.Empty;
                    string filePath = string.Empty;
                    int userId = Convert.ToInt32(Session["UserId"].ToString());
                    string sFilename = "";
                    if (FileUpload1.PostedFile != null)
                    {
                        HttpPostedFile myFile = FileUpload1.PostedFile;
                        int nFileLen = myFile.ContentLength;
                        if (nFileLen != 0)
                        {
                            DirectoryInfo dirInfo = null;
                            fileSavePath = "/Data/TS_" + userId + "/Images/";
                            path = Server.MapPath("~" + fileSavePath);
                            if (!Directory.Exists(path))
                            {
                                dirInfo = Directory.CreateDirectory(path);
                            }
                            sFilename = System.IO.Path.GetFileName(myFile.FileName);
                            path = path + "/" + sFilename;
                            FileUpload1.PostedFile.SaveAs(path);

                            finalPath = Path.Combine(fileSavePath, sFilename);
                        }
                    }
                    strImgFinalPath = finalPath;

                    if (FileUpload2.PostedFile != null)
                    {
                        HttpPostedFile myFile = FileUpload2.PostedFile;
                        int nFileLen = myFile.ContentLength;
                        if (nFileLen != 0)
                        {
                            path = Server.MapPath("~" + fileSavePath);
                            sFilename = System.IO.Path.GetFileName(myFile.FileName);
                            path = path + "/" + sFilename;
                            FileUpload2.PostedFile.SaveAs(path);

                            finalPath = Path.Combine(fileSavePath, sFilename);

                            strImgFinalPath = strImgFinalPath + ":" + finalPath;
                        }
                    }

                    if (FileUpload3.PostedFile != null)
                    {
                        HttpPostedFile myFile = FileUpload3.PostedFile;
                        int nFileLen = myFile.ContentLength;
                        if (nFileLen != 0)
                        {
                            path = Server.MapPath("~" + fileSavePath);
                            sFilename = System.IO.Path.GetFileName(myFile.FileName);
                            path = path + "/" + sFilename;
                            FileUpload3.PostedFile.SaveAs(path);

                            finalPath = Path.Combine(fileSavePath, sFilename);
                            strImgFinalPath = strImgFinalPath + ":" + finalPath;
                        }
                    }

                    if (FileUpload4.PostedFile != null)
                    {
                        HttpPostedFile myFile = FileUpload4.PostedFile;
                        int nFileLen = myFile.ContentLength;
                        if (nFileLen != 0)
                        {
                            path = Server.MapPath("~" + fileSavePath);
                            sFilename = System.IO.Path.GetFileName(myFile.FileName);
                            path = path + "/" + sFilename;
                            FileUpload4.PostedFile.SaveAs(path);

                            finalPath = Path.Combine(fileSavePath, sFilename);
                            strImgFinalPath = strImgFinalPath + ":" + finalPath;
                        }
                    }

                    if (FileUpload5.PostedFile != null)
                    {
                        HttpPostedFile myFile = FileUpload5.PostedFile;
                        int nFileLen = myFile.ContentLength;
                        if (nFileLen != 0)
                        {
                            path = Server.MapPath("~" + fileSavePath);
                            sFilename = System.IO.Path.GetFileName(myFile.FileName);
                            path = path + "/" + sFilename;
                            FileUpload5.PostedFile.SaveAs(path);

                            finalPath = Path.Combine(fileSavePath, sFilename);
                            strImgFinalPath = strImgFinalPath + ":" + finalPath;
                        }
                    }

                    adbll.CreateAdImageDetails(0, intAdpostId, strImgFinalPath, txtVidolink.Text.ToString());

                    #endregion

                    Response.Redirect("ViewAds.aspx?aid=" + intAdpostId.ToString() + "&uid=" + Session["UserId"].ToString());

                }
                catch (System.Threading.ThreadAbortException th)
                {
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
    }
}