<%@ Page Title="CreateAdpost" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ViewAds.aspx.cs" Inherits="YardeCart.Account.ViewAds" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <table>
            <tr>
                <td class="auto-style2" colspan="3" style="font-family: 'Arial Black'; color: #CC3300; font-size: xx-large; vertical-align: top" >
                    <asp:Label ID="lblCategory" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="adimage1" runat="server" class="auto-style2" rowspan="2">
                    &nbsp;
                </td>
                <td id="adimage2" runat="server" class="auto-style2">
                    &nbsp;</td>
                <td id="adimage3" runat="server" class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="adimage4" runat="server" class="auto-style2">
                    &nbsp;</td>
                <td id="adimage5" runat="server" class="auto-style2">
                    &nbsp;</td>
            </tr>
            
            
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="lbllAdtitle" runat="server" Font-Bold="True" Font-Names="Century" Font-Size="X-Large" ForeColor="#0066FF" ></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="lblAddesc" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" ForeColor="#00CC00" ></asp:Label>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            
            
            <tr>
                <td class="auto-style2" colspan="3">
                    <span id="spnVideo" runat="server"></span>


                </td>
            </tr>
        </table>

</asp:Content>