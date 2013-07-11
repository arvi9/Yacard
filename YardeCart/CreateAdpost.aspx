<%@ Page Title="Yard-eCart Ad post" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="CreateAdpost.aspx.cs" Inherits="YardeCart.CreateAdpost" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <link href="CSS/FormValidation.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.validate.password.css" rel="stylesheet" type="text/css" />
    
    <div id="form-content" style="vertical-align:central; padding-left:200px;padding-top:50px;">
        <fieldset id="fieldset1">
           
            <table style="width: 700px" >
                <tr>
                    <td colspan="2" class="auto-style21">
                 <div class="divHeadForm" style="text-align:left;">
               <h3> Post An Ad in 30 Secs</h3>
                     <p> &nbsp;</p>
            </div>
                        </td>
                    </tr>
            <tr>
                <td class="auto-style5"><label class="label" style="width:150px;" for="txtTitle">Title</label></td>
                <td class="auto-style6"><asp:TextBox class="input" ID="txtTitle" runat="server" Height="24px" Width="400px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="100"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtTitle" runat="server" ErrorMessage="Enter Ad Title"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style7"><label class="label" for="txtDesc">Description</label></td>
                <td class="auto-style8"><asp:TextBox class="textarea" ID="txtDesc" runat="server" MaxLength="1000" TextMode="MultiLine" BorderWidth="1px" BorderColor="Black" BorderStyle="Solid" Height="50px" Width="400px" TabIndex="1" ></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="auto-style19"><label class="label" for="txtKeywords">Keywords</label></td>
                <td class="auto-style20"><asp:TextBox class="textarea" ID="txtKeywords" runat="server" TextMode="MultiLine" BorderWidth="1px" Height="50px" Width="400px" BorderColor="Black" BorderStyle="Solid" MaxLength="1000" TabIndex="2" ></asp:TextBox></td>
            </tr>

            <tr>
                <td class="auto-style13"><label class="label" for="ddlCategory">Category</label></td>
                <td class="auto-style14" style="padding-top: 5px"><asp:DropDownList class="input" ID="ddlCategory" runat="server" style="border:solid 1px" Height="24px" Width="400px" TabIndex="3"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style14">
                    <asp:Label ID="ErrCategory" ForeColor="Red" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13"><label class="label" for="txtPrice">Price</label></td>
                <td class="auto-style14"><asp:TextBox class="input" ID="txtPrice" runat="server" BorderWidth="1px" Height="20px" Text="0.00" TabIndex="4"></asp:TextBox></td>
                <td class="auto-style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtPrice" runat="server" ErrorMessage="Enter Price"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td class="auto-style13"><label class="label" for="DatePicker1">Show Till Date</label></td>
                <td class="auto-style14">
                    <%--<asp:TextBox class="input" ID="txtTillDate" runat="server" TextMode="Date" BorderWidth="1px" Height="22px" TabIndex="5"></asp:TextBox>--%>
                    <cc1:DatePicker ID="DatePicker1" runat="server" Width="100px" PaneWidth="200px" EnableViewState="true" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="20px" TabIndex="5">
            <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
            <PaneHeaderStyle BackColor="#0099FF" />
            <TitleStyle ForeColor="White" Font-Bold="true" />
            <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
            <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
            <DayHeaderStyle BackColor="#E8E8E8" />
            <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99"/>
            <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false"/>
            <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false"/>
        </cc1:DatePicker>
                </td>
                <td class="auto-style14">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtTillDate" runat="server" ErrorMessage="Select Till date"></asp:RequiredFieldValidator>--%>
                    <asp:Label ID="ErrDate" ForeColor="Red" runat="server" ></asp:Label>
                </td>

            </tr>
            
            <tr>
                <td class="auto-style3"><label >Add Image for Ad</label></td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="6" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="FileUpload1" runat="server" ErrorMessage="Select image file"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload2" runat="server"  Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="7" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload3" runat="server" Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="8" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload4" runat="server"  Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="9" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload5" runat="server" Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="10" />
                </td>
            </tr>
            <tr>
                <td class="auto-style13"><label class="label" for="txtVidolink">Youtube Video link</label></td>
                <td class="auto-style16"><asp:TextBox class="input" ID="txtVidolink" runat="server" Width="399px" BorderWidth="1px" Height="20px" MaxLength="50" TabIndex="11"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnAddPost" runat="server" Text="Add Post" OnClick="btnAddPost_Click" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" Width="105px" TabIndex="12" />
                    </td>
            </tr>

            </table>
        </fieldset>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
        }
        .auto-style2
        {
            width: 112px;
        }
        .auto-style3
        {
            height: 22px;
            width: 161px;
        }
        .auto-style4
        {
            width: 161px;
        }
        .auto-style5 {
            width: 161px;
            height: 38px;
        }
        .auto-style6 {
            height: 38px;
        }
        .auto-style7 {
            width: 161px;
            height: 60px;
        }
        .auto-style8 {
            height: 60px;
        }
        .auto-style13 {
            width: 161px;
            height: 35px;
        }
        .auto-style14 {
            height: 35px;
        }
        .auto-style16 {
            width: 112px;
            height: 35px;
        }
        .auto-style19 {
            width: 161px;
            height: 61px;
        }
        .auto-style20 {
            height: 61px;
        }
        .auto-style21 {
            height: 72px;
        }
    </style>
</asp:Content>
