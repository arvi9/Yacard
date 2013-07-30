<%@ Page Title="Yard e-Cart User Activation" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="YardeCart.ResetPassword" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div style="padding-top:25px;">
    <table style="height: 257px; width: 745px">
        <tr>
            <td class="auto-style4" colspan="2">

                <div>
                    <h3>Reset Password</h3>
                    <br />
                </div>

            </td>
        </tr>
        <tr>
            <td class="auto-style5" id="tblMessage" runat="server" colspan="2">

                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">

                &nbsp;</td>
            <td>

                &nbsp;</td>
        </tr>
        <tr>
                <td ID="TableCell19" runat="server" class="auto-style6" style="text-align: right">
                    <label for="txtEmail">New Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td>
                   &nbsp;&nbsp;<asp:TextBox ID="txtNewPwd" runat="server"  Height="24"  Width="200px" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="30" TabIndex="7" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
                <td ID="Td1" runat="server" class="auto-style6" style="text-align: right">
                    <label for="txtEmail">Confirm Password</label>&nbsp;&nbsp;&nbsp;
                </td>
            <td>
                    &nbsp;&nbsp;<asp:TextBox ID="txtConPwd" runat="server" Height="24"  Width="200px" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="30" TabIndex="7" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">

                &nbsp;</td>
            <td>

                   &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Font-Bold="True" Visible="False"></asp:Label>

            </td>
        </tr>
        <tr>
            <td class="auto-style6">

                &nbsp;</td>
            <td>

                    &nbsp;&nbsp;<asp:Button ID="btnSend" Width="150px" runat="server" Text="Change Password" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" OnClick="btnSend_Click" TabIndex="16" />

            </td>
        </tr>
        <tr>
            <td class="auto-style6">

                &nbsp;</td>
            <td>

                &nbsp;</td>
        </tr>
    </table>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
        }
        .auto-style5 {
        }
        .auto-style6 {
            width: 232px;
        }
    </style>
</asp:Content>

