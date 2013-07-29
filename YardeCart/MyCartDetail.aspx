<%@ Page Title="Yard eCart Cart details" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="MyCartDetail.aspx.cs" Inherits="YardeCart.MyCartDetail" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div>
           <table style="width:900px;" id="tblAdpost" runat="server">
            <tr style="height:40px;">
                <td style="text-align:left;vertical-align:central; font-size:large;font-weight:600;" class="auto-style4">&nbsp;
                <asp:Label ID="lblCart" runat="server" Text="Shopping"/>
                </td>
                <td style="text-align:right;vertical-align:central;">&nbsp;
                <asp:Button ID="btnKeep" runat="server" Text="Keep Shopping" BorderStyle="Groove" BorderWidth="1px" Width="150px" OnClick="btnKeep_Click" Height="30px"/>
                </td>
            </tr>
            <tr><td colspan="2">
            <asp:GridView ID="GridView1" runat="server" Width="800px" AllowPaging="true" DataKeyNames="CartId" OnRowDeleting="GridView1_RowDeleting"
                    AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" RowStyle-BorderColor="Tan" RowStyle-BorderWidth="1px"
                    ShowHeader="False" OnPageIndexChanging="GridView1_PageIndexChanging" BorderColor="Black" BorderWidth="2px" PageSize="10"
                    >
                    <Columns>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <table style="width:600px;">
                                    <tr><td style="text-align:right;vertical-align:central;">
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" style="text-align:center;" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="25px" Width="105px"> Remove </asp:LinkButton>
                                    </td></tr>
                                    <tr><td>
                                    <span id="spnHtml0" runat="server"></span>
                                    </td></tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                </asp:GridView>
            </td></tr>
               <tr><td class="auto-style4" style="text-align: center" colspan="2">
                    <asp:Button ID="btnBuy" Width="100" Height="28px" runat="server" Text="BUY" BorderStyle="Groove" BorderWidth="1px"  OnClick="btnBuy_Click" />

                   </td>
               </tr>
           </table>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            width: 865px;
        }
    </style>
</asp:Content>
