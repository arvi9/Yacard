<%@ Page Title="Yard eCart Login" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="YardeCart.AdminLogin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="AdminloginForm" >
        <asp:Panel ID="Panel1" runat="server" style="padding-left:200px; padding-top:50px">
                <p class="validation-summary-errors" style="color: #FF0000">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset >
                    <legend></legend>
                    <ol>
                        <li>
                            <h3 >Admin Log in</h3>
                            <p>
                                &nbsp;</p>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">Admin User name</asp:Label>
                        </li>
                        <li>
                            <asp:TextBox ID="UserName" runat="server" Height="27px" Width="287px" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="11"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />--%>
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Admin Password</asp:Label>
                        </li>
                        <li>
                            <asp:TextBox ID="Password" runat="server" Height="27px" TextMode="Password" CssClass="validate[required]" Width="287px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="30" TabIndex="12" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />--%>
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" TabIndex="13"/>
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox" ForeColor="#660066">Remember me?</asp:Label>
                        </li>
                        <li>
                            <asp:Button ID="btnLogin" runat="server" Text="Log in" Font-Bold="true" OnClick="btnLogin_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="14"  />
                        </li>
                        <li>
                            <asp:Label runat="server" ID="lblError" Visible="false" />
                        </li>
                    </ol>
                </fieldset>
        </asp:Panel>
    </section>
</asp:Content>