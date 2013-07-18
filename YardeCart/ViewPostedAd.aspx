<%@ Page Title="Yard-eCart View Posted Ads" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ViewPostedAd.aspx.cs" Inherits="YardeCart.ViewPostedAd" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div>
        <table style="width:900px;text-align: center;" id="Table1" runat="server">
            <tr><td colspan="2">
                &nbsp;&nbsp; </td></tr>
            <tr>
                <td>
                <asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search Ads" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <div>
           <table style="width:900px;" id="tblAdpost" runat="server">
            <tr><td>&nbsp;</td></tr>
            <tr><td>
                <asp:GridView ID="GridView1" runat="server" Height="400px" Width="800px" AllowPaging="false" 
                    AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" 
                    ShowHeader="False" OnPageIndexChanging="GridView1_PageIndexChanging"
                    >
                    <Columns>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml0" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml1" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml2" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml3" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                </asp:GridView>
            </td></tr>
           </table>
            </div>
        

</asp:Content>
