<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YardeCart.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
    </hgroup>
    
    <section id="loginForm" style="background-color:skyblue">
        <div style="text-align:center;font-family:'Microsoft Sans Serif';fill:bisque;background-color:greenyellow"><h3>Log in</h3></div>
        <asp:Panel runat="server" >
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="true" ID="login" Width="194px">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset >
                    <legend></legend>
                    <ol>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="UserName" ForeColor="#660066">User name</asp:Label>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password" ForeColor="#660066">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" ForeColor="#660066"/>
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox" ForeColor="#660066">Remember me?</asp:Label>
                        </li>
                    </ol>
                    <asp:Button ID="btnLogin" runat="server" CommandName="Login" Text="Log in" BackColor="#339966" Font-Bold="true" OnClick="btnLogin_Click"  />
                </fieldset>
                <div>
                    <asp:Label runat="server" ID="lblError" Visible="false" />
                </div>
            </LayoutTemplate>
        </asp:Login>
</asp:Panel><div>
                    <asp:Label runat="server" ID="lblError" Visible="false" />
                </div>

        <p style="text-align:center;">
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>
    </section>
</asp:Content>
