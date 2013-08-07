<%@ Page Title="Yard e-Cart Buy Ad" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="BuyAdslist.aspx.cs" Inherits="YardeCart.BuyAdslist" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <table>
<tr><td style="border: thick groove #660066" colspan="2"><a title='{0}' href='{3}' ><IMG SRC='{3}' width='180px' style='border: thin ridge #C0C0C0; height: 140px' ></td></tr>
<tr><td style='font-size: large; font-weight: 800; color: #800080; height:30px;' colspan="2">{0}</td></tr>
<tr><td style='font-size: x-large; font-weight: 500; color:green; background-color: #FFFFCC; font-family: Tahoma; text-align: center; vertical-align: middle;' class="auto-style5" colspan="2">{4}</td></tr>
<tr><td style='font-size: medium; font-weight: 200; color:gray;' colspan="2">{2}</td></tr>
<tr><td ><a href='{6}' style='font-size: large; font-weight: 800; color:chocolate;'>SOLD</a></td><td style="text-align: right" >&nbsp;<a href='{5}' style='font-size: small; font-weight: 100;color:GrayText;'>Details</a></td></tr></table>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            height: 30px;
        }
        .auto-style5 {
            height: 29px;
        }
    </style>
</asp:Content>

