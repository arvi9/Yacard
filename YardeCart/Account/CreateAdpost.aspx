<%@ Page Title="CreateAdpost" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="CreateAdpost.aspx.cs" Inherits="YardeCart.Account.CreateAdpost" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
        
        #form-content {
            vertical-align:central;
            margin:50px,25px;
            margin-bottom: 30px;
            margin-left: 20px;
            margin-top: 10px;
            padding: 25px 250px 10px;
            width: 700px;
    }
        label {
        float: left;
    padding: 15px 0 0;
    text-align: right;
    width: 150px;

        }

     input{
    float: left;
    margin: 10px 30px;
    }
textarea{
    float: left;
    margin: 10px 30px;
    height: 30px;
    width:300px;
}
combo{
    float: left;
    margin: 30px 30px;
    width:300px;
}

        .auto-style2 {
            width: 539px;
        }

    </style>
    <div id="form-content" style="background-color: #B5F0C8; ">
        <fieldset id="fieldset1">
            <div class="divHeadForm" style="text-align:center;">
               <h3> Create Ad Post </h3>
            </div>
            <table >
            <tr>
                <td><label class="label" for="txtTitle">Title</label></td>
                <td><asp:TextBox class="input" ID="txtTitle" runat="server"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td><label class="label" for="txtDesc">Description</label></td>
                <td><asp:TextBox class="textarea" ID="txtDesc" runat="server" TextMode="MultiLine" ></asp:TextBox></td>
            </tr>
            
            <tr>
                <td><label class="label" for="txtKeywords">Keywords</label></td>
                <td><asp:TextBox class="textarea" ID="txtKeywords" runat="server" TextMode="MultiLine" ></asp:TextBox></td>
            </tr>

            <tr>
                <td><label class="label" for="ddlCategory">Category</label></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList class="input" ID="ddlCategory" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label class="label" for="txtPrice">Price</label></td>
                <td><asp:TextBox class="input" ID="txtPrice" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label class="label" for="txtTillDate">Show Till Date</label></td>
                <td><asp:TextBox class="input" ID="txtTillDate" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td><label >Add Image for Ad</label></td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="18px" Width="311px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload2" runat="server"  Height="18px" Width="311px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload3" runat="server" Height="18px" Width="311px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload4" runat="server"  Height="18px" Width="311px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload5" runat="server" Height="18px" Width="311px" />
                </td>
            </tr>
            <tr>
                <td><label class="label" for="txtVidolink">Youtube Video link</label></td>
                <td class="auto-style2"><asp:TextBox class="input" ID="txtVidolink" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnAddPost" runat="server" Text="Add Post" OnClick="btnAddPost_Click" />
                    </td>
            </tr>

            </table>
        </fieldset>
    </div>

</asp:Content>