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
                        <asp:BoundField DataField="AdPostId" Visible="false" InsertVisible="false"/>
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
                    &nbsp;</td>
               </tr>
               <tr><td class="auto-style4" style="text-align: left; line-height: 30px; text-indent: 15px; vertical-align: top; padding-left: 100px;" colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" Text="Delivery charges"></asp:Label>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderStyle="None" CellPadding="0" CellSpacing="0" Height="25px" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="175px">
                        <asp:ListItem Selected="True" Value="0">Normal </asp:ListItem>
                        <asp:ListItem Value="1">Premium</asp:ListItem>
                    </asp:RadioButtonList>--%>
                    <asp:DropDownList ID="ddlDeliType" Height="24px" Width="150px" CssClass="validate[required] radio" 
                                style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="2"></asp:DropDownList>&nbsp;&nbsp; 
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Visible="false"></asp:Label>

                   </td>
               </tr>
               <tr><td class="auto-style4" style="text-align: center" colspan="2">
                    &nbsp;</td>
               </tr>
               <tr><td class="auto-style4" style="text-align: center" colspan="2">
                    <asp:Button ID="btnBuy" Width="100" Height="28px" runat="server" Text="BUY" BorderStyle="Groove" BorderWidth="1px"  OnClick="btnBuy_Click" />

                   </td>
               </tr>
               <tr><td class="auto-style4" style="text-align: center" colspan="2">
                    &nbsp;</td>
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
