<%@ Page Title="Yard eCart Admin Page" Language="C#" MasterPageFile="~/YardeAdmin.Master" AutoEventWireup="true" CodeBehind="AdsList.aspx.cs" Inherits="YardeCart.AdsList" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">


<script language="javascript" type="text/javascript" >

    function toggle_visibility(id) {
        var str = document.getElementById("ctl00_ctl03_txtName").value;
        var e = document.getElementById(id);
        if (e.style.display == 'none' && str == '') {
            e.style.display = 'block';
        }
        else if (e.style.display == 'block' && str != '') {
            e.style.display = 'block';
        }
        else if (e.style.display == 'block' && str == '') {
            e.style.display = 'none';
        }
        else
            e.style.display = 'block';

    }
    </script>
    <table>
        <tr>
            <td><a href="#"  onclick="toggle_visibility('tblAlbum');">New Album</a></td>
        </tr>
    </table>
<table id="tblAlbum">
    <tr>
        <td align="right" class="style1" valign="top">
            <asp:Label ID="Label1" runat="server" Text="Album Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server"  Width="200px" Height="20px" ></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="reqAlbum" EnableClientScript="true" ControlToValidate="txtName" ErrorMessage="Album name should not be empty" runat="server"></asp:RequiredFieldValidator>--%>
            <asp:Label ID="ErrMsg" runat="server" Text=""  ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="right" class="style1" valign="top">
            <asp:Label ID="Label2" runat="server" Text="Album Message"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMessage" runat="server" Width="200px" Height="20px" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;
        </td>
        <td>
            <asp:Button ID="btnSave" runat="server" Height="20px" Text="Save" Width="93px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Height="20px" Text="Cancel" Width="93px" CausesValidation="false"/>
        </td> 
    </tr>
</table>
<asp:GridView ID="GridView1" runat="server" Height="110%" Width="100%" ShowHeader="false"
                GridLines="None" bgcolor='#748CAD' AutoGenerateColumns="false" AllowPaging="true" 
                PageSize="4" PagerSettings-Mode="Numeric" PagerStyle-BackColor="ControlDark" PagerSettings-Position="Bottom"
                PagerStyle-HorizontalAlign="Left" PagerSettings-Visible="true"
                PagerStyle-ForeColor="AliceBlue" Style="margin-right: 20px" >
                <RowStyle BorderColor="Green"></RowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Album Detail(s)" ItemStyle-Width="100px" HeaderStyle-Width="100px"
                        ItemStyle-Font-Size="12px" ItemStyle-BorderColor="Blue">
                        <ItemTemplate>
                            <span id="spnHtml0" runat="server" style="font-family: Verdana; font-size: small; color: #660033;"></span>
                        </ItemTemplate>
                        <ItemStyle BorderColor="Blue" Font-Size="12px" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Album Detail(s)" ItemStyle-Width="100px" HeaderStyle-Width="100px"
                        ItemStyle-Font-Size="12px" ItemStyle-BorderColor="Blue">
                        <ItemTemplate>
                            <span id="spnHtml1" runat="server" style="font-family: 'Verdana'; font-size: small; color: #660033;"></span>
                        </ItemTemplate>
                        <ItemStyle BorderColor="Blue" Font-Size="12px" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

<script language="javascript" type="text/javascript" >
    toggle_visibility('tblAlbum');
</script>

</asp:Content>

