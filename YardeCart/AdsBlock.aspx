<%@ Page Title="Yard eCart Ads Page" Language="C#" MasterPageFile="~/YardeAdmin.Master" AutoEventWireup="true" CodeBehind="AdsBlock.aspx.cs" Inherits="YardeCart.AdsBlock" %>

<asp:content runat="server" id="BodyContent" contentplaceholderid="MainContent">

    <div>
        <table style="width:100%;" id="Table1" runat="server">
            <tr style="text-align: center;"><td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Block Adposts" Font-Bold="True" Font-Size="Large"></asp:Label> </td></tr>
            <tr><td>&nbsp;&nbsp;Search
                <asp:RadioButtonList ID="rdoSearch" runat="server" CausesValidation="false" TextAlign="Right" Height="16px" RepeatDirection="Horizontal" Width="110px">
                    <asp:ListItem Value="0" Selected="True">Ads</asp:ListItem>
                    <asp:ListItem Value="1">Users</asp:ListItem>
                </asp:RadioButtonList>
                </td>
                <td>
                <asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <div>
        <table style="width:100%;" id="tblAdpost" runat="server" visible="false">
            <tr><td>&nbsp;</td></tr>
            <tr><td>
    <asp:Button ID="btnCheckAll" runat="server" Text="Check All Ads" Font-Bold="true" OnClick="btnCheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All Ads" Font-Bold="true" OnClick="btnUncheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="125px" TabIndex="3"  />
               </td></tr>
            <tr><td style="text-align:center;"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>&nbsp;</td></tr>
             <tr><td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AdPostId"
                GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="50" Width="750px" Height="400px" HeaderStyle-Height="30px" HeaderStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center"
                RowStyle-Height="30px" RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Center" HeaderStyle-Wrap="true"
                 >
                <Columns>
                    <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkBlockStatus" runat="server" 
                            AutoPostBack="true"
                            Checked='<%# Convert.ToBoolean(Eval("AdBlocked")) %>'
                            />&nbsp;&nbsp;&nbsp;Blocked
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
             <tr><td>
    <asp:Button ID="btnBlock" runat="server" Text="Block Ads" Font-Bold="true" OnClick="btnBlock_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />
        </td></tr></table>
    </div>
</asp:content>