<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ActivateUser.aspx.cs" Inherits="YardeCart.Account.ActivateUser" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <section id="loginForm" style="background-color:mistyrose">
        <div style="text-align:center;font-family:'Microsoft Sans Serif';fill:bisque;background-color:greenyellow"><h3>User activation</h3></div>

        <div>
            <div style="color: coral; font-size:large;">
                Your account is activated successfully. Please goto Login page
                <a href="Login.aspx">Click here to Login</a>
            </div>
        </div>
    </section>
</asp:Content>
