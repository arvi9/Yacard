<%@ Page Title="Yard-eCart Log in" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YardeCart.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
    </hgroup>
    
 <section id="loginForm" >
<%--        <div><h3 style=" padding-left:360px; ">Log in</h3></div>--%>
        <asp:Panel ID="Panel1" runat="server" >
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="true" ID="login" Width="624px" Height="173px">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset >
                    <legend></legend>
                    <ol>
                        <li>
                            <h3 >Log in</h3>
                            <p>
                                &nbsp;</p>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label>
                        </li>
                        <li>
                            <asp:TextBox ID="UserName" runat="server" Height="27px" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Password</asp:Label>
                        </li>
                        <li>
                            <asp:TextBox ID="Password" runat="server" Height="27px" TextMode="Password" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe"/>
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox" ForeColor="#660066">Remember me?</asp:Label>
                        </li>
                        <li></li>
                    </ol>
                    <asp:Button ID="btnLogin" runat="server" CommandName="Login" Text="Log in" Font-Bold="true" OnClick="btnLogin_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px"  />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
</asp:Panel>
        <div>
                    <asp:Label runat="server" ID="lblError" Visible="false" />
                </div>
        <p style="text-align:center;">
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>
    </section>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p></p></asp:Content>
