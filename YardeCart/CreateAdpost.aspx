<%@ Page Title="Yard-eCart Ad post" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="CreateAdpost.aspx.cs" Inherits="YardeCart.CreateAdpost" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <link href="CSS/FormValidation.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.validate.password.css" rel="stylesheet" type="text/css" />
    
    <div id="form-content" style="vertical-align:central; padding-left:200px;">
        <fieldset id="fieldset1">
           
            <table >
                <tr>
                    <td colspan="2">
                 <div class="divHeadForm" style="text-align:left;">
               <h3> Post An Ad in 30 Secs</h3>
                     <p> &nbsp;</p>
                     <p> &nbsp;</p>
            </div>
                        </td>
                    </tr>
            <tr>
                <td class="auto-style4"><label class="label" for="txtTitle">Title</label></td>
                <td><asp:TextBox class="input" ID="txtTitle" runat="server" Height="24px" Width="551px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtTitle" runat="server" ErrorMessage="Enter Ad Title"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style4"><label class="label" for="txtDesc">Description</label></td>
                <td><asp:TextBox class="textarea" ID="txtDesc" runat="server" TextMode="MultiLine" BorderWidth="1px" Height="81px" Width="551px" ></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="auto-style4"><label class="label" for="txtKeywords">Keywords</label></td>
                <td><asp:TextBox class="textarea" ID="txtKeywords" runat="server" TextMode="MultiLine" BorderWidth="1px" Height="68px" Width="551px" ></asp:TextBox></td>
            </tr>

            <tr>
                <td class="auto-style4"><label class="label" for="ddlCategory">Category</label></td>
                <td><asp:DropDownList class="input" ID="ddlCategory" runat="server" Height="48px" Width="317px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <asp:Label ID="ErrCategory" ForeColor="Red" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><label class="label" for="txtPrice">Price</label></td>
                <td><asp:TextBox class="input" ID="txtPrice" runat="server" BorderWidth="1px" Height="24px" Text="0.00"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtPrice" runat="server" ErrorMessage="Enter Price"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td class="auto-style4"><label class="label" for="txtTillDate">Show Till Date</label></td>
                <td><asp:TextBox class="input" ID="txtTillDate" runat="server" TextMode="Date" BorderWidth="1px" Height="24px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtTillDate" runat="server" ErrorMessage="Select Till date"></asp:RequiredFieldValidator>
                </td>

            </tr>
            
            <tr>
                <td class="auto-style3"><label >Add Image for Ad</label></td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="24px" Width="551px" BorderWidth="1px" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="FileUpload1" runat="server" ErrorMessage="Select image file"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload2" runat="server"  Height="24px" Width="551px" BorderWidth="1px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload3" runat="server" Height="24px" Width="551px" BorderWidth="1px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload4" runat="server"  Height="24px" Width="551px" BorderWidth="1px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload5" runat="server" Height="24px" Width="551px" BorderWidth="1px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><label class="label" for="txtVidolink">Youtube Video link</label></td>
                <td class="auto-style2"><asp:TextBox class="input" ID="txtVidolink" runat="server" Width="551px" BorderWidth="1px" Height="24px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2">
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnAddPost" runat="server" Text="Add Post" OnClick="btnAddPost_Click" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" Width="105px" />
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
            width: 116px;
        }
        .auto-style4
        {
            width: 116px;
        }
    </style>
</asp:Content>
