<%@ Page Title="Yard eCart Admin Page" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="UsersBlock.aspx.cs" Inherits="YardeCart.UsersBlock" %>

<asp:content runat="server" id="BodyContent" contentplaceholderid="MainContent">

    <div style="font-family:Tahoma;padding-top:25px;" BorderColor="Tan" BorderWidth="1px">
        <table style="width:900px;" id="Table1" runat="server">
            <tr><td>&nbsp;</td></tr>
            <tr style="text-align: center;"><td>
                <asp:Label ID="Label2" runat="server" Text="Block Users" Font-Bold="True" Font-Size="Large"></asp:Label> </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr style="text-align: center;"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%--<asp:Label ID="Label1" runat="server" AssociatedControlID="txtSearch">Search User</asp:Label>--%>&nbsp;&nbsp;
                <asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="1"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search User" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="2"  />&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div>
        <table style="width:900px;border:groove;border-color:slategrey" id="tblUser" runat="server" visible="false" border="1">
            <tr><td>&nbsp;</td></tr>
            <tr><td>
    <asp:Button ID="btnCheckAll" runat="server" Text="Check All Users" Font-Bold="true" OnClick="btnCheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="4"  />&nbsp;&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All Users" Font-Bold="true" OnClick="btnUncheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="125px" TabIndex="4"  />
               </td></tr>
            <tr><td style="text-align:center;"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>&nbsp;</td></tr>
            <tr><td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="UserId" BorderColor="Tan" BorderWidth="1px"
                        GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                        PageSize="50" Width="700px" HeaderStyle-Height="30px" HeaderStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center"
                RowStyle-Height="30px" RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Center" HeaderStyle-Wrap="true" AlternatingRowStyle-Height="30px"
                 >
                <Columns>
                            <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Right" >
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkBlockStatus" runat="server" 
                                    AutoPostBack="true" 
                                    Checked='<%# Convert.ToBoolean(Eval("UserBlocked")) %>'
                                    />&nbsp;Blocked
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-Width="200px" ItemStyle-Height="30px"/>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-Width="200px" ItemStyle-Height="30px"/>
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="200px" ItemStyle-Height="30px"/>
                        </Columns>
                <PagerSettings FirstPageText="First" LastPageText="Last" 
                    Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
            
            </asp:GridView>
                  </td></tr> 
            <tr><td>&nbsp;</td></tr>
             <tr><td style="text-align: center;">
    <asp:Button ID="btnBlock" runat="server" Text="Block Users" Font-Bold="true" OnClick="btnBlock_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="6"  />
        </td></tr></table>
    </div>
</asp:content>