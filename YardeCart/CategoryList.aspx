<%@ Page Title="Yard eCart Admin Page" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="YardeCart.CategoryList" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">

        $(document).ready(function () {

            $("#MainContent_btnCancel").click(function () {
                $("#MainContent_txtName").val('');
                $("#MainContent_txtName").removeClass('validate[required]');
                $("#MainContent_ddlCategory").val('');
            });

        }
        );

</script>
    <div style="font-family:Tahoma;padding-top:50px;" BorderColor="Tan" BorderWidth="1px">
    <table style="font-size: large; height: 25px; width:900px; text-align: center;">
        <tr>
            <td>List of Category</td>
        </tr>
    </table>
    <table id="tblCategory" style="width:900px;">
            <tr><td class="auto-style7">&nbsp;</td></tr>
        <tr>
            <td align="center" class="auto-style8" valign="center" style="text-align: right; padding-right: 25px">
                <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtName" runat="server" Height="27px" Width="300px" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="auto-style5" valign="center" style="padding-right: 20px; text-align: right">
                <asp:Label ID="Label4" runat="server" Text="Category Group"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlCategory" Height="24px" Width="300px" CssClass="validate[required] radio" style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="2"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Add" Font-Bold="true" OnClick="btnSave_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Font-Bold="true" CausesValidation="false" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="4" OnClick="btnCancel_Click"  />
            </td> 
        </tr>
    </table>
        </div>
    <p></p>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="CategoryId"
     Width="750px" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnCancelCommand="DataList1_CancelCommand"
OnDeleteCommand="DataList1_DeleteCommand" OnEditCommand="DataList1_EditCommand"
OnUpdateCommand="DataList1_UpdateCommand">
                <HeaderTemplate>  

                    <table width="100%">  

                        <tr align="left">  

                            <th width="10%">  

                                &nbsp;
                            </th>  

                            <th width="30%">  

                                Category Name  

                            </th>  
                            <th width="30%">  

                                Category Group  

                            </th>  

                            <th>  

                                &nbsp;</th>  

                        </tr>  

                </HeaderTemplate>

              <ItemTemplate>
                    <tr align="left">
                        <td>
                            <asp:label runat="server" ID="lblSNO"></asp:label>
                        </td>
                    <td>
                    <%# DataBinder.Eval(Container.DataItem, "CategoryName") %>
                    </td>
                    <td>
                    <%# DataBinder.Eval(Container.DataItem, "CategoryGroupName") %>
                    </td>
                    <td style="visibility:hidden;">
                    <%# DataBinder.Eval(Container.DataItem, "CategoryId") %>
                    </td>
                        <td>
<asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit"> Edit </asp:LinkButton>
&nbsp;|&nbsp;
<asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete"> Delete </asp:LinkButton>
                    </td>
                    </tr>
               </ItemTemplate>
              <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtId" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryId") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCName" runat="server" Height="22px" Width="150px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" Height="22px" Width="150" DataTextField="CategoryGroupName" DataValueField="CategoryGroupId"
                                DataSourceID="CategoriesDataSource">
                            </asp:DropDownList>
                        </td>
                        
                        <td>
<asp:LinkButton ID="lnkUpdate" runat="server" CommandName="update">Update </asp:LinkButton>
<asp:LinkButton ID="lnkCancel" runat="server" CommandName="cancel">Cancel </asp:LinkButton>
</td>
</tr>
</EditItemTemplate>
<FooterTemplate>
</table></FooterTemplate>
<FooterStyle  />
<SelectedItemStyle/> <AlternatingItemStyle />
<HeaderStyle Font-Bold="True" />
</asp:DataList>
     <br />
    <asp:ObjectDataSource ID="CategoriesDataSource" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="SelectCategoryGroup"
        TypeName="YardeCart.Business.Category">
    </asp:ObjectDataSource>
    
<table width="750px" id="tblPaging" runat="server">  

<tr>  

<td height="10px">  

</td>  

</tr>  

<tr id="PagingRow" runat="server">  

<td colspan="3" style="background-color: #3D3D3D; padding-left: 15px;">  

<table width="99%" class="pagingBackground" cellpadding="2" cellspacing="2">  

<tr>  

<td width="20%">  

</td>  

<td align="center" width="50">  

</td>  

<td align="center">  

</td>  

<td align="center" width="20%">  

</td>  

</tr>  

<tr>  

<td width="20%" align="left" style="color: #FFFFFF">  

 &nbsp;  

<asp:Label ID="LabelPageFirstRecord" runat="server"></asp:Label>  

<asp:Label ID="label2" runat="server" Text="-"></asp:Label>  

<asp:Label ID="LabelPageLastRecord" runat="server"></asp:Label>  

<asp:Label ID="label3" runat="server" Text="of"></asp:Label>  

<asp:Label ID="LabelTotalRecords" runat="server"></asp:Label>  

</td>  

<td width="50" align="center">  

</td>  

<td align="center" id="tdPageNumbers" runat="server" style="color: #FFFFFF">  

<asp:LinkButton ID="LinkButtonFirst" runat="server" OnClick="LinkButtonFirst_Click" CssClass="PagerLinkStyle"> First </asp:LinkButton>  

<asp:LinkButton ID="LinkButtonPrevious" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButtonPrevious_Click"> Prev </asp:LinkButton>  

<asp:LinkButton ID="LinkButton1" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">1</asp:LinkButton>  

<asp:LinkButton ID="LinkButton2" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">2</asp:LinkButton>  

<asp:LinkButton ID="LinkButton3" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">3</asp:LinkButton>  

<asp:LinkButton ID="LinkButton4" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">4</asp:LinkButton>  

<asp:LinkButton ID="LinkButton5" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">5</asp:LinkButton>  

<asp:LinkButton ID="LinkButtonNext" runat="server" CssClass="PagerLinkStyle" OnClick="LinkButtonNext_Click"> Next </asp:LinkButton>  

<asp:LinkButton ID="LinkButtonLast" runat="server" OnClick="LinkButtonLast_Click" CssClass="PagerLinkStyle"> Last </asp:LinkButton>  

</td>  

<td width="20%" align="right">  

</td>  

</tr>  

<tr>  

<td width="20%">  

</td>  

<td align="center" width="50">  

</td>  

<td align="center">  

</td>  

<td align="center" width="20%">  

</td>  

</tr>  

</table>  

</td>  

</tr>  

</table> 


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style5 {
            width: 349px;
            height: 37px;
        }
        .auto-style6 {
            height: 37px;
        }
        .auto-style7 {
            width: 349px;
        }
        .auto-style8 {
            width: 349px;
            height: 20px;
        }
        .auto-style9 {
            height: 20px;
        }
    </style>
</asp:Content>

