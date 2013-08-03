<%@ Page Title="Yard eCart Reports" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="AdsReport.aspx.cs" Inherits="YardeCart.AdsReport" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <script type="text/javascript">

        $(document).ready(function () {
            Change();
        });
        function Change() {
            if (document.getElementById("MainContent_rdoSearch_0").checked == true) {

                $("#divreg").show(100);
                $("#divdate").hide(100);

            }

            if (document.getElementById("MainContent_rdoSearch_1").checked == true) {

                $("#divreg").hide(100);
                $("#divdate").show(100);

            }
        }
    </script>
    
        <div style="font-family:Tahoma;padding-top:25px;" BorderColor="Tan" BorderWidth="1px">
        <table style="width:900px; height: 127px;" id="Table1" runat="server">
            <tr><td class="auto-style5">&nbsp;</td></tr>
            <tr style="text-align: center;"><td colspan="3">
                <asp:Label ID="Label2" runat="server" Text="Reports" Font-Bold="True" Font-Size="Large"></asp:Label> </td></tr>
            <tr><td class="auto-style5">&nbsp;</td></tr>
            <tr><td class="auto-style5">
                <asp:RadioButtonList ID="rdoSearch" runat="server" CausesValidation="false" onchange="return Change();" TextAlign="Right" Height="16px" RepeatDirection="Horizontal" Width="143px" TabIndex="1">
                    <asp:ListItem Value="0" Selected="True">Region</asp:ListItem>
                    <asp:ListItem Value="1">Date</asp:ListItem>
                </asp:RadioButtonList>
                </td>
                <td class="auto-style6">&nbsp;&nbsp;
                <div id="divreg"><asp:TextBox ID="txtSearch" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="2" ></asp:TextBox>
                </div>
                    <div id="divdate" ><asp:Panel ID="pnlDate" runat="server">
                    From <cc1:DatePicker ID="DatePicker1" runat="server"  Width="100px" PaneWidth="200px" EnableViewState="true" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="20px" TabIndex="6">
            <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
            <PaneHeaderStyle BackColor="#0099FF" />
            <TitleStyle ForeColor="White" Font-Bold="true" />
            <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
            <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
            <DayHeaderStyle BackColor="#E8E8E8" />
            <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99"/>
            <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false"/>
            <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false"/>
        </cc1:DatePicker> To
                    <cc1:DatePicker ID="DatePicker2" runat="server"  Width="100px" PaneWidth="200px" EnableViewState="true" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="20px" TabIndex="6">
            <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
            <PaneHeaderStyle BackColor="#0099FF" />
            <TitleStyle ForeColor="White" Font-Bold="true" />
            <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
            <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
            <DayHeaderStyle BackColor="#E8E8E8" />
            <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99"/>
            <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false"/>
            <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false"/>
        </cc1:DatePicker>
                    </asp:Panel>
                </div>
                    &nbsp;&nbsp;
                &nbsp;&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Ok" OnClick="btnSearch_Click" Font-Bold="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="65px" TabIndex="3"  /><asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <p></p>
    <div>
        <table style="width:900px;border:groove;border-color:slategrey" id="tblAdpost" runat="server" visible="false" border="1">
            <tr><td class="auto-style4"></td></tr>
            <tr><td>
               </td></tr>
            <tr><td style="text-align:center;"><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>&nbsp;</td></tr>
            <tr><td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AdPostId" BorderColor="Tan" BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound"
                                GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="50" Width="750px" HeaderStyle-Height="30px" HeaderStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Center"
                RowStyle-Height="30px" RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Center" HeaderStyle-Wrap="true" AlternatingRowStyle-Height="30px"
                RowStyle-BorderStyle="Solid" RowStyle-BorderWidth="1px" RowStyle-BorderColor="Tan"
                >
                <Columns>
                    <asp:BoundField DataField="AdPostTitle" HeaderText="Ad Name" ItemStyle-Width="150px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="PostedDate" HeaderText="Posted Date" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="SaleDate" HeaderText="Purchased Date" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="SaleLocationId" HeaderText="Region" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="CurrentStatus" HeaderText="Status" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="BuyerName" HeaderText="Buyer Name" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="BuyerAddress" HeaderText="Buyer Address" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                    <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" ItemStyle-Width="100px" ItemStyle-Height="30px"/>
                </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" 
            Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        
            </asp:GridView>
                  </td></tr> 
            <tr><td>&nbsp;</td></tr>

             <tr><td style="text-align:center;">
        </td></tr></table>
    </div>


</asp:content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            height: 22px;
        }
        .auto-style5 {
            width: 231px;
        }
        .auto-style6 {
            width: 369px;
        }
    </style>

    



</asp:Content>




