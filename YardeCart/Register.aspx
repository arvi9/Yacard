<%@ Page Title="Yard-eCart Register" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YardeCart.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <link href="CSS/FormValidation.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.validate.password.css" rel="stylesheet" type="text/css" />
    <style>
        FormColumnLabel {
        height:30px;
        width:310px;
        }
FormColumnInput {
        height:30px;
        width:310px;
        }
FormColumnError {
        height:30px;
        width:100px;
        }

        .auto-style2 {
            height: 37px;
        }
        .auto-style5 {
            height: 29px;
        }
        .auto-style6 {
            height: 58px;
        }
        .auto-style7 {
            height: 37px;
            width: 253px;
        }
        .auto-style8 {
            width: 253px;
        }
        .auto-style12 {
            height: 29px;
            width: 253px;
        }
        .auto-style13 {
            height: 58px;
            width: 253px;
        }

    .auto-style14 {
        height: 35px;
        width: 253px;
    }
    .auto-style15 {
        height: 35px;
    }
    .auto-style16 {
        height: 33px;
        width: 253px;
    }
    .auto-style17 {
        height: 33px;
    }
    .auto-style18 {
        height: 34px;
        width: 253px;
    }
    .auto-style19 {
        height: 34px;
    }

        .auto-style20 {
            width: 606px;
        }
        .auto-style21 {
            height: 33px;
            width: 606px;
        }
        .auto-style22 {
            height: 35px;
            width: 606px;
        }
        .auto-style23 {
            height: 34px;
            width: 606px;
        }
        .auto-style24 {
            height: 29px;
            width: 606px;
        }
        .auto-style25 {
            height: 58px;
            width: 606px;
        }
        .auto-style26 {
            width: 253px;
            height: 40px;
        }
        .auto-style27 {
            width: 606px;
            height: 40px;
        }
        .auto-style28 {
            height: 40px;
        }

        .auto-style30 {
            height: 38px;
            width: 606px;
        }
        .auto-style31 {
            height: 38px;
        }
        .auto-style32 {
            height: 38px;
            width: 253px;
        }

        .auto-style34 {
            height: 37px;
            width: 606px;
        }
        .auto-style35 {
            height: 37px;
        }

    </style>
      <div style="vertical-align:central;padding-left:200px;padding-top:50px">
        <div ><h3 >Registeration form</h3><br />
            <br />
        </div>
        <table ID="Table1" runat="server" HorizontalAlign="Justify" GridLines="Horizontal"  Height="610px" Width="856px" style="font-size: small; font-family: Calibri">
            <tr runat="server" ID="trUsername">
                <td ID="TableCell1" runat="server" class="auto-style7" >
                    <label style="width:250px" for="txtUsername">User Name</label>
                </td>
                <td ID="TableCell2" runat="server" class="auto-style20" >
                    <asp:TextBox ID="txtUsername" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ForeColor="Red"
                         ErrorMessage="enter username"></asp:RequiredFieldValidator>--%>    &nbsp;
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidateRequestMode="Disabled" 
                        CausesValidation="False" TabIndex="1">Check avaiilablity</asp:LinkButton>
              
                </td>
                <td ID="TableCell3" runat="server" class="auto-style7">
                        <asp:Image ID="imgAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/checked.gif" />
                          <asp:Image ID="imgNotAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/unchecked.gif" />
        </td>
            </tr>
            <tr ID="trFirstname" runat="server">
                <td ID="TableCell4" runat="server" class="auto-style7">
                    <label for="txtFirstname">First Name</label>
                 
                </td>
                <td ID="TableCell5" runat="server" class="auto-style34"  >
                    <asp:TextBox ID="txtFirstname" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="valtxtFirstname" runat="server" ForeColor="Red" ControlToValidate="txtFirstname" ErrorMessage="must enter your First name"></asp:RequiredFieldValidator>--%>
                 
                </td>
                <td ID="TableCell6" runat="server" class="auto-style35">
                    <%--<div align="center">
        <a href="#" class="open_popup">Add Bank details</a>
    </div>--%>
                </td>
            </tr>
            <tr ID="trLastname" runat="server">
                <td ID="TableCell7" runat="server" class="auto-style32">
                    <label for="txtLastname">Last Name</label>
                 
                </td>
                <td ID="TableCell8" runat="server" class="auto-style30"  >
                    <asp:TextBox ID="txtLastname" runat="server" Height="24" Width="300" CssClass="validate[required]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="3"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="valtxtLastname" runat="server" ForeColor="Red" ControlToValidate="txtLastname" ErrorMessage="must enter your Last name"></asp:RequiredFieldValidator>--%>
                 
                </td>
                <td ID="TableCell9" runat="server" class="auto-style31">
                </td>
            </tr>
            <tr ID="trGender" runat="server">
                <td ID="TableCell10" runat="server" class="auto-style8">
                    <label for="gender">Gender</label>
                 
                </td>
                <td ID="TableCell11" runat="server" class="auto-style20"  >
                    <div class="divOption"  >
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" TextAlign="right" RepeatDirection="Horizontal" TabIndex="4" >
                                        <asp:ListItem Selected="True" Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                        <asp:ListItem Value="0">Rather not say</asp:ListItem>
                                    </asp:RadioButtonList>
                        </div>
                    <%--<asp:RadioButton ID="rdoFemale" runat="server" Text="Female"  TextAlign="Left" />
                    <asp:RadioButton ID="rdoMale" runat="server" Text="Male" TextAlign="Right" />
                    <asp:RadioButton ID="rdoRather" runat="server" Text="Rather not say" TextAlign="Right" />--%>
                </td>
                <td ID="TableCell12" runat="server">
                    <span class="inline-notice" id="Span5">
                 </span>
                 <span class="inline-input-error-message" id="Span6"></span>
             
                </td>
            
            </tr>
            <tr ID="trPassword" runat="server">
                <td ID="TableCell13" runat="server" class="auto-style32">
                    <label for="txtPassword">Password</label>
                 
                </td>
                <td ID="TableCell14" runat="server" class="auto-style30"  >
                    <asp:TextBox ID="txtPassword" runat="server" Height="24" Width="300" CssClass="validate[required]" TextMode="Password" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="25" TabIndex="5"></asp:TextBox>
                      <%--<asp:RequiredFieldValidator ID="valtxtPassword" runat="server"  ForeColor="Red" ControlToValidate="txtPassword" 
                        ErrorMessage="must enter your Password"></asp:RequiredFieldValidator>--%>
               
                </td>
                <td ID="TableCell15" runat="server" class="auto-style31">
                </td>
            
            </tr>
            <tr ID="trRePassword" runat="server">
                <td ID="TableCell16" runat="server" class="auto-style8">
                    <label for="txtRePassword">Confirm Password</label>
                 
                </td>
                <td ID="TableCell17" runat="server" class="auto-style20"  >
                    <asp:TextBox ID="txtRePassword" runat="server" Height="24"  Width="300" CssClass="validate[required]" TextMode="Password" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="25" TabIndex="6"></asp:TextBox>
                      <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtRePassword" ControlToCompare="txtPassword"
                         ForeColor="Red" ErrorMessage="Password mismatch"></asp:CompareValidator>
               
                </td>
                <td ID="TableCell18" runat="server">
                    <%--<asp:Label ID="errPwd" ForeColor="Red" runat="server" Visible="false"></asp:Label>--%>
                </td>
            </tr>
            <tr ID="trEmail" runat="server">
                <td ID="TableCell19" runat="server" class="auto-style26">
                    <label for="txtEmail">Email Address</label>
                 
                </td>
                <td ID="TableCell20" runat="server" class="auto-style27"  >
                    <asp:TextBox ID="txtEmail" runat="server" Height="24"  Width="300" CssClass="validate[required,custom[email]]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="30" TabIndex="7"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="valtxtEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="must enter your Email" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                    <asp:Label ID="lblErrorEmail" runat="server" ForeColor="Red" Text="Already exists" Visible="False"></asp:Label>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ForeColor="Red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"   EnableClientScript="true" ErrorMessage="Invalid Email"></asp:RegularExpressionValidator>--%>
                </td>
                <td ID="TableCell21" runat="server" class="auto-style28">
                    
                </td>
            </tr>
            <tr ID="trMobile" runat="server">
                <td ID="TableCell22" runat="server" class="auto-style14">
                    <label for="txtMobile">Mobile</label>
                 
                </td>
                <td ID="TableCell23" runat="server" class="auto-style22"  >
                    <asp:TextBox ID="txtMobile" runat="server" Height="24"  Width="300" CssClass="validate[required,custom[phone]" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="25" TabIndex="8"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" ForeColor="Red"
                        ErrorMessage="must enter mobile no"></asp:RequiredFieldValidator>--%>
                     <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile" ForeColor="Red"
ErrorMessage="Please Only Numbers"  ValidationExpression="^\d+$"></asp:RegularExpressionValidator>--%>
                   
                </td>
                <td ID="TableCell24" runat="server" class="auto-style15">
                </td>
            </tr>
            <tr ID="trAddress" runat="server">
                <td ID="TableCell25" runat="server" class="auto-style14">
                    <label for="txtAddress">Address</label>
                 
                </td>
                <td ID="TableCell26" runat="server" class="auto-style22"  >
                    <asp:TextBox ID="txtAddress" runat="server" Height="24"  Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="9"></asp:TextBox>
                </td>
                <td ID="TableCell27" runat="server" class="auto-style15">
                    <span class="inline-notice" id="Span13">
                 </span>
                 <span class="inline-input-error-message" id="Span14"></span>
             
                </td>
            </tr>
            <tr ID="trStreetname" runat="server">
                <td ID="TableCell28" runat="server" class="auto-style14">
                    <label for="txtStreetname">Street name</label>
                 
                </td>
                <td ID="TableCell29" runat="server" class="auto-style22"  >
                    <asp:TextBox ID="txtStreetname" runat="server" Height="24"  Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="10"></asp:TextBox>
                 
                </td>
                <td ID="TableCell30" runat="server" class="auto-style15">
                    <span class="inline-notice" id="Span15">
                 </span>
                 <span class="inline-input-error-message" id="Span16"></span>
             
                </td>
            </tr>
            <tr ID="trCountry" runat="server">
                <td ID="TableCell31" runat="server" class="auto-style16">
                    <label for="ddlCountry">Country</label>
                 
                </td>
                <td ID="TableCell32" runat="server" class="auto-style21"  >
                    <asp:DropDownList ID="ddlCountry" Height="24px" Width="300" style="border:solid 1px; transform-style:flat;"  runat="server" TabIndex="11" CssClass=" "></asp:DropDownList>
                </td>
                <td ID="TableCell33" runat="server" class="auto-style17">
                    <span class="inline-notice" id="Span17">
                 </span>
                 <span class="inline-input-error-message" id="Span18"></span>
             
                </td>
            </tr>
            <tr ID="trState" runat="server">
                <td ID="TableCell34" runat="server" class="auto-style16">
                    <label for="ddlState">State</label>
                 
                </td>
                <td ID="TableCell35" runat="server" class="auto-style21"  >
                    <asp:DropDownList ID="ddlState" Height="24px" Width="300" style="border:solid 1px"  runat="server" TabIndex="12"></asp:DropDownList>
                </td>
                <td ID="TableCell36" runat="server" class="auto-style17">
                    <span class="inline-notice" id="Span19">
                 </span>
                 <span class="inline-input-error-message" id="Span20"></span>
             
                </td>
            </tr>
            <tr ID="trCity" runat="server">
                <td ID="TableCell37" runat="server" class="auto-style16">
                    <label for="ddlCity">City</label>
                 
                </td>
                <td ID="TableCell38" runat="server" class="auto-style21"  >
                    <asp:DropDownList ID="ddlCity" Height="24px" Width="300" style="border:solid 1px" runat="server" TabIndex="13"></asp:DropDownList>
                </td>
                <td ID="TableCell39" runat="server" class="auto-style17">
                    <span class="inline-notice" id="Span21">
                 </span>
                 <span class="inline-input-error-message" id="Span22"></span>
             
                </td>
            </tr>
            <tr ID="trZipcode" runat="server">
                <td ID="TableCell40" runat="server" class="auto-style14">
                    <label for="txtZipcode">Zip code</label>
                 
                </td>
                <td ID="TableCell41" runat="server" class="auto-style22"  >
                    <asp:TextBox ID="txtZipcode" Height="24px" Width="300" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="15" TabIndex="14"></asp:TextBox>
                </td>
                <td ID="TableCell42" runat="server" class="auto-style15">
                    <span class="inline-notice" id="Span23">
                 </span>
                 <span class="inline-input-error-message" id="Span24"></span>
             
                </td>
            </tr>
            <tr ID="trCheck" runat="server">
                <td ID="TableCell43" runat="server" class="auto-style18">
                 &nbsp;
                </td>
                <td ID="TableCell44" runat="server" class="auto-style23"  >
                    <asp:CheckBox ID="chkYardecart" runat="server" TabIndex="15" class="validate[required] checkbox"    />
                    <label for="etsy_finds">I agree to the Yard e-Cart Terms of Service and Privacy policy.</label>
                </td>
                <td ID="TableCell45" runat="server" class="auto-style19">
                </td>
            </tr>
            <tr ID="TableRow2" runat="server">
                <td ID="TableCell46" runat="server" class="auto-style12">
                 &nbsp;
                </td>
                <td ID="TableCell47" runat="server" class="auto-style24"  >
                    <asp:Label runat="server" ID="ErrCheck" Visible="false" ForeColor="Red"></asp:Label>
                   <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Font-Bold="true"></asp:Label>
                 &nbsp;
                </td>
                <td ID="TableCell48" runat="server" class="auto-style5">
                    <span class="inline-notice" id="Span27">
                 </span>
                 <span class="inline-input-error-message" id="Span28"></span>
             
                </td>
            </tr>
            <tr ID="trRegister" runat="server">
                <td ID="TableCell49" runat="server" class="auto-style13">
                 &nbsp;
                </td>
                <td ID="TableCell50" runat="server" class="auto-style25"  >
                    <asp:Button ID="btnRegister" Width="100" runat="server" Text="Register" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" OnClick="btnRegister_Click" TabIndex="16" />
                </td>
                <td ID="TableCell51" runat="server" class="auto-style6">
                     <span class="inline-notice" id="Span29">
                 </span>
                 <span class="inline-input-error-message" id="Span30"></span>
             
                </td>
            </tr>
        </table>
        </div>

</asp:Content>