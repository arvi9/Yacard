<%@ Page Title="Yard eCart Ads Page" Language="C#" MasterPageFile="~/YardeAdmin.Master" AutoEventWireup="true" CodeBehind="AdsDelete.aspx.cs" Inherits="YardeCart.AdsDelete" %>

<asp:content runat="server" id="BodyContent" contentplaceholderid="MainContent">

    <div>
        <table style="width:100%;">
            <tr style="background-color: #006600; color: #FFFFFF; font-size: large; height: 25px; width:100%; text-align: center;"><td>DELETE ADS  </td></tr>
            <tr><td>
    <asp:Button ID="btnCheckAll" runat="server" Text="Check All Ads" Font-Bold="true" OnClick="btnCheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All Ads" Font-Bold="true" OnClick="btnUncheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="125px" TabIndex="3"  />
               </td></tr>
            <tr><td>&nbsp;</td></tr>
             <tr><td>
    <asp:GridView ID="GridView1" runat="server" BackColor="LightSkyBlue" DataKeyNames="AdPostId"
                GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="15" Width="400px" Height="400px">
                <Columns>
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDeleteStatus" runat="server" 
                            AutoPostBack="true"
                            Checked='<%# Convert.ToBoolean(Eval("AdDeleted")) %>'
                            />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AdPostTitle" HeaderText="Ad Title"/>
                </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" 
            Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        
            </asp:GridView>
                  </td></tr> 
            <tr><td>&nbsp;</td></tr>

             <tr><td>
    <asp:Button ID="btnBlock" runat="server" Text="Delete Ads" Font-Bold="true" OnClick="btnBlock_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />
        </td></tr></table>
    </div>
</asp:content>