<%@ Page Title="Yard eCart User profile" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="YardeCart.EditProfile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_Test').click(function () {
                if ($('#MainContent_txtFirstName').val() == '')
                {
                    alert('Enter First Name');
                }                
            });
            $('input[id$=txtFirstName]').validate({
                rules: {
                    '<%= UserName.UniqueID %>': {                        
                        required: true
                    }
                }, messages:  {
                   
                   
                    '<%= UserName.UniqueID %>':{ 
                        required: "<span  style='color:red'>* Required Field *</span>"
                    }
                }
            });
            $('#MainContent_txtFirstName').validate(function () {
                alert('Hi');
            });
        }
        );
    </script>--%>

    <script type="text/javascript">

        $(document).ready(function () {
           // $("#MainContent_txtEmail").addClass('validate[required,custom[email]]');
            var a = $("#MainContent_txtEmail").val();
            //alert("hi");
        }
        );

</script>
    
    <script src="scripts/jquery-1.4.3.min.js" type="text/javascript"></script>
    <style type="text/css">
        .web_dialog_overlay
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }
        .web_dialog
        {
            display: none;
            position: fixed;
            width: 380px;
            height: 275px;
            top: 50%;
            left: 50%;
            margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
            border: 2px solid #336699;
            padding: 0px;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
        }
        .web_dialog_title
        {
            border-bottom: solid 2px #336699;
            background-color: black;
            padding: 4px;
            color: White;
            font-weight:bold;
        }
        .web_dialog_title a
        {
            color: White;
            text-decoration: none;
        }
        .align_right
        {
            text-align: right;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#btnChangePwd").click(function (e) {
                ShowDialog(false);
                e.preventDefault();
            });

            $("#btnShowModal").click(function (e) {
                ShowDialog(true);
                e.preventDefault();
            });

            $("#btnClose").click(function (e) {
                $('input[id$=txtOldpwd]').val('');
                $('input[id$=txtNewpwd]').val('');
                $('input[id$=txtConpwd]').val('');
                HideDialog();
                e.preventDefault();
            });

            $('input[id$=btnSubmit]').click(function (e) {
                $("#MainContent_txtEmail").addClass('validate[required,custom[email]]');

                if ($('input[id$=txtOldpwd]').val() != $('input[id$=hdnPassword]').val())
                    alert("Enter correct old password");
                else if ($('input[id$=txtNewpwd]').val() != $('input[id$=txtConpwd]').val())
                    alert("Enter confirm password as above");
                else
                    HideDialog();
                e.preventDefault();
            });
        });

        function ShowDialog(modal) {
            $("#overlay").show();
            $("#dialog").fadeIn(300);

            if (modal) {
                $("#overlay").unbind("click");
            }
            else {
                $("#overlay").click(function (e) {
                    HideDialog();
                });
            }
        }

        function HideDialog() {
            $("#overlay").hide();
            $("#dialog").fadeOut(300);
        }

    </script>
    <div style="vertical-align:central;padding-left:100px;padding-top:50px">
        <div >
            <h3 >Profile Information</h3><br />
        </div>
        <div>
            <table style="width:700px;border-bottom-left-radius:4px;border-width:thin; border-style:groove">
                <tr>
                    <td colspan="2" style="text-align:right;">
                        <input type="button" id="btnChangePwd" value="Change Password" style="border-style: groove; border-width: 1px;height:28px; width:180px;" />
    
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:central;">
                        <div style="vertical-align:central;"> 
                        <table>
                            <tr style="height:40px;">
                                <td style="width:150px;">
                                    <label>First Name</label>
                                </td>
                                <td style="width:250px;">
                                    <%--<asp:TextBox ID="txtFirstName" CssClass="TextRequired" runat="server"></asp:TextBox>--%>
                                    <asp:TextBox ID="txtFirstName" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td style="width:150px;">
                                    <label>Last Name</label>
                                </td>
                                <td style="width:250px;">
                                    <asp:TextBox ID="txtLastName" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>Gender</label>
                                </td>
                                <td>
                                    <div >
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" TextAlign="right" RepeatDirection="Horizontal" TabIndex="4" >
                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                    <asp:ListItem Value="0">Rather not say</asp:ListItem>
                                                </asp:RadioButtonList>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>E mail</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Height="24" Width="300" CssClass="validate[required,custom[email]]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblErrorEmail" runat="server" ForeColor="Red" Text="Already exists" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>Mobile</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMobile" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td style="width:150px;">
                                    Address
                                </td>
                                <td style="width:250px;">
                                    <asp:TextBox ID="txtAddress" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Street name
                                </td>
                                <td>
                                    <asp:TextBox ID="txtStreetname" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Country
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCountry" Height="24px" Width="300" style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="11" CssClass=" "></asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>State</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlState" Height="24px" Width="300" style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="11" CssClass=" "></asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    City
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCity" Height="24px" Width="300" style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="11" CssClass=" "></asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Zipcode
                                </td>
                                <td>
                                    <asp:TextBox ID="txtZipcode" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" Width="100" runat="server" Text="Save" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" OnClick="btnSave_Click" TabIndex="16" />
                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                    <asp:Button ID="btnCancel" Width="100" runat="server" Text="Cancel" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" OnClick="btnCancel_Click" TabIndex="16" />

                                </td>
                            </tr>
                        </table>
                        </div>
                    </td>
                    <td> 
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input id="hdnPassword" runat="server" type="hidden" />
    <div id="output"></div>
    
    <div id="overlay" class="web_dialog_overlay"></div>
    
    <div id="dialog" class="web_dialog">
        <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
            <tr>
                <td class="web_dialog_title">Change Password</td>
                <td class="web_dialog_title align_right">
                    <a href="#" id="btnClose">Close</a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <label id="lblPwdError" runat="server" visible="false" style="color:red;"></label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 25px;">
                    <label>Old password</label>
                    <asp:TextBox ID="txtOldpwd" runat="server" TextMode="Password" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 25px;">
                    <label>New password</label>
                    <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 25px;">
                    <label>Confirm password</label>
                    <asp:TextBox ID="txtConpwd" runat="server" TextMode="Password" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnSubmit" Width="100" runat="server" Text="Submit" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" TabIndex="16" OnClick="btnSubmit_Click"/>
                </td>
            </tr>
        </table>
    </div>
    </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
</asp:Content>
