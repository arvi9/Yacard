<%@ Page Title="Yard eCart Ads Page" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="AdsDelete.aspx.cs" Inherits="YardeCart.AdsDelete" %>

<asp:content runat="server" id="BodyContent" contentplaceholderid="MainContent">

    <div style="font-family:Tahoma;padding-top:25px;" BorderColor="Tan" BorderWidth="1px">
        <table style="width:900px;" id="Table1" runat="server">
            <tr><td>&nbsp;</td></tr>
            <tr style="text-align: center;"><td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Delete Adposts" Font-Bold="True" Font-Size="Large"></asp:Label> </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>
                <asp:RadioButtonList ID="rdoSearch" runat="server" CausesValidation="false" TextAlign="Right" Height="16px" RepeatDirection="Horizontal" Width="110px">
                    <asp:ListItem Value="0" Selected="True">Ads</asp:ListItem>
                    <asp:ListItem Value="1">Users</asp:ListItem>
                </asp:RadioButtonList>
                </td>
                <td>&nbsp;&nbsp;
                <asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div>
        <table style="width:900px;border:groove;border-color:slategrey" id="Table2" runat="server" visible="false" border="1">
            <tr><td>&nbsp;</td></tr>
            <tr><td>
    <asp:Button ID="btnCheckAll" runat="server" Text="Check All Ads" Font-Bold="true" OnClick="btnCheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All Ads" Font-Bold="true" OnClick="btnUncheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="125px" TabIndex="3"  />
               </td></tr>
            <tr><td style="text-align:center;"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>&nbsp;</td></tr>
             <tr><td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AdPostId" BorderColor="Tan" BorderWidth="1px"
                GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="50" Width="750px" HeaderStyle-Height="30px" HeaderStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center"
                RowStyle-Height="30px" RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Center" HeaderStyle-Wrap="true" AlternatingRowStyle-Height="30px"
                >
                <Columns>
                    <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDeleteStatus" runat="server" 
                            AutoPostBack="true"
                            Checked='<%# Convert.ToBoolean(Eval("AdDeleted")) %>'
                            />&nbsp;&nbsp;&nbsp;Deleted
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AdPostTitle" HeaderText="Ad Title" ItemStyle-Width="200px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-Width="150px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-Width="150px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="150px" ItemStyle-Height="30px"/>
                </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" 
            Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        
            </asp:GridView>
                  </td></tr> 
            <tr><td>&nbsp;</td></tr>

             <tr><td style="text-align:center;">
    <asp:Button ID="btnBlock" runat="server" Text="Delete Ads" Font-Bold="true" OnClick="btnBlock_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />
        </td></tr></table>
    </div>
</asp:content>