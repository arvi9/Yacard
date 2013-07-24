<%@ Page Title="Yard eCart Ads Page" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="AdsBlock.aspx.cs" Inherits="YardeCart.AdsBlock" %>

<asp:content runat="server" id="BodyContent" contentplaceholderid="MainContent">
    <script type="text/javascript">

        $(document).ready(function () {

            $('#<%=btnCheckAll.UniqueID%>').click(function () {
                var slvals = []

                $('input:checkbox[id=chkBlockStatus]:checked').each(function () {

                    slvals.push($(this).val())

                });
                alert('Selected Checkbox values are: ' + slvals)

            });

        }
        );

</script>
    <div style="font-family:Tahoma;padding-top:25px;" >
        <table style="width:900px;" id="Table1" runat="server">
            <tr><td>&nbsp;</td></tr>
            <tr style="text-align: center;"><td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Block Adposts" Font-Bold="True" Font-Size="Large"></asp:Label> </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>
                <asp:RadioButtonList ID="rdoSearch" runat="server" CausesValidation="false" TextAlign="Right" Height="16px" RepeatDirection="Horizontal" Width="110px" TabIndex="1">
                    <asp:ListItem Value="0" Selected="True">Ads</asp:ListItem>
                    <asp:ListItem Value="1">Users</asp:ListItem>
                </asp:RadioButtonList>
                </td>
                <td>&nbsp;&nbsp;
                <asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="2"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div>
        <table style="width:900px;border:groove;border-color:slategrey" id="tblAdpost" runat="server" visible="false" border="1">
            <tr><td>&nbsp;</td></tr>
            <tr><td>
    <asp:Button ID="btnCheckAll" runat="server" Text="Check All Ads" Font-Bold="true" OnClick="btnCheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3" Visible="False"  />&nbsp;&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" Text="Uncheck All Ads" Font-Bold="true" OnClick="btnUncheckAll_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="125px" TabIndex="3" Visible="False"  />
               </td></tr>
            <tr><td style="text-align:center;"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>&nbsp;</td></tr>
             <tr><td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AdPostId" BorderColor="Tan" BorderWidth="1px" OnRowCreated="GridView1_RowCreated"
                GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="50" Width="750px" HeaderStyle-Height="30px" HeaderStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center"
                RowStyle-Height="30px" RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Center" HeaderStyle-Wrap="true" AlternatingRowStyle-Height="30px"
                 >
                <Columns>
                    <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Right" >
                       <HeaderTemplate>
                        <asp:CheckBox ID="chkBoxSelectDeSelectAll" onclick="javascript:SelectDeSelectAll(this);" runat="server" />Select All
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkBlockStatus" runat="server" 
                            AutoPostBack="false"
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
             <tr><td style="text-align: center;">
    <asp:Button ID="btnBlock" runat="server" Text="Block Ads" Font-Bold="true" OnClick="btnBlock_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3"  />
        </td></tr></table>
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
    var TotalNoOfCheckBoxes;
    var Counter;

    $(document).ready(function () {
        //Get total no. of CheckBoxes in side the GridView.
        TotalNoOfCheckBoxes = parseInt('<%= this.GridView1.Rows.Count %>');
        Counter = 0;
    });

    function SelectDeSelectAll(CheckBox) {
        //Get all the control of the type INPUT inside the Gridview.
        var Inputs = $("#<%= this.GridView1.ClientID %>").find("input");

        //Checked/Unchecked all the checkBoxes in side the GridView.
        for (var n = 0; n < Inputs.length; ++n) {
            if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf("chkBlockStatus", 0) >= 0) {
                Inputs[n].checked = CheckBox.checked;
            }
        }

        //Reset Counter
        Counter = CheckBox.checked ? TotalNoOfCheckBoxes : 0;
    }

    function ChildCheckBoxClick(CheckBox, HCheckBox) {
        //get target control.
        var HeaderCheckBox = document.getElementById(HCheckBox);

        //Modifiy Counter; 
        if (CheckBox.checked && Counter < TotalNoOfCheckBoxes)
            Counter++;
        else if (Counter > 0)
            Counter--;

        //Change state of the header CheckBox.
        if (Counter < TotalNoOfCheckBoxes)
            HeaderCheckBox.checked = false;
        else if (Counter == TotalNoOfCheckBoxes)
            HeaderCheckBox.checked = true;
    }
</script>
</asp:content>