<%@ Page Title="About" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="YardeCart.MyProfile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="vertical-align:central;padding-left:100px;padding-top:50px">
        <div >
            <h3 >Profile Information</h3><br />
        </div>
        <div>
            <table style="width:571px; border-bottom-left-radius:4px;border-width:thin; border-style:groove">
                <tr>
                    <td colspan="2"  style="text-align:right;">
                     <asp:LinkButton ID="lnkEditProfile" runat="server"  style="text-align:center;" OnClick="lnkEditProfile_Click" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="Medium" Width="150px">Edit Profile</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:central;">
                        <div style="vertical-align:central;"> 
                        <table>
                            <tr style="height:40px;">
                                <td style="width:150px;">
                                    <label>Name</label>
                                </td>
                                <td style="width:250px;">
                                    <asp:Label ID="lblName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>Gender</label>
                                </td>
                                <td>
                                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>E mail</label>
                                </td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>Mobile</label>
                                </td>
                                <td>
                                    <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </td>
                    <td> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                                    <hr width="100%" style="vertical-align: middle; text-align: center" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="vertical-align:central;"> 
                        <table>
                            <tr style="height:40px;">
                                <td style="width:150px;">
                                    Address
                                </td>
                                <td style="width:250px;">
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Street name
                                </td>
                                <td>
                                    <asp:Label ID="lblStreetname" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Country
                                </td>
                                <td>
                                    <asp:Label ID="lblCountry" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    <label>State</label>
                                </td>
                                <td>
                                    <asp:Label ID="lblState" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    City
                                </td>
                                <td>
                                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                    Zipcode
                                </td>
                                <td>
                                    <asp:Label ID="lblZipcode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="height:40px;">
                                <td>
                                </td>
                                <td>
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
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            height: 22px;
        }
    </style>
</asp:Content>
