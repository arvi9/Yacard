<%@ Page Title="Yard-eCart Register" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YardeCart.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="CSS/FormValidation.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.validate.password.css" rel="stylesheet" type="text/css" />
    
      <div style="vertical-align:central; padding-left:200px;">
        <div ><h3 >Registeration form</h3><br />
            <br />
            <br />
        </div>
        <table ID="Table1" runat="server" HorizontalAlign="Justify" GridLines="Horizontal"  Height="510px" Width="856px" style="font-size: small; font-family: Calibri">
            <tr runat="server" ID="trUsername">
                <td ID="TableCell1" Width="300" runat="server">
                    <label style="width:300px" for="txtUsername">User Name</label>
                </td>
                <td ID="TableCell2" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtUsername" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ForeColor="Red"
                         ErrorMessage="must enter username"></asp:RequiredFieldValidator>    
                    
                </td>
                <td ID="TableCell3" runat="server">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidateRequestMode="Disabled" CausesValidation="False">Check avaiilablity</asp:LinkButton>
                        <asp:Image ID="imgNotAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/unchecked.gif" />
                        <asp:Image ID="imgAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/checked.gif" />
                </td>
            </tr>
            <tr ID="trFirstname" runat="server">
                <td ID="TableCell4" runat="server">
                    <label for="txtFirstname">First Name</label>
                 
                </td>
                <td ID="TableCell5" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtFirstname" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                </td>
                <td ID="TableCell6" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtFirstname" runat="server" ForeColor="Red" ControlToValidate="txtFirstname" ErrorMessage="must enter your First name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr ID="trLastname" runat="server">
                <td ID="TableCell7" runat="server">
                    <label for="txtLastname">Last Name</label>
                 
                </td>
                <td ID="TableCell8" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtLastname" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                </td>
                <td ID="TableCell9" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtLastname" runat="server" ForeColor="Red" ControlToValidate="txtLastname" ErrorMessage="must enter your Last name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr ID="trGender" runat="server">
                <td ID="TableCell10" runat="server">
                    <label for="gender">Gender</label>
                 
                </td>
                <td ID="TableCell11" runat="server" class="auto-style1" >
                    <div class="divOption" style="width:554px;"  >
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" TextAlign="right" RepeatDirection="Horizontal" >
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
                <td ID="TableCell13" runat="server">
                    <label for="txtPassword">Password</label>
                 
                </td>
                <td ID="TableCell14" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtPassword" runat="server" Height="24" Width="300" TextMode="Password" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                </td>
                <td ID="TableCell15" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtPassword" runat="server"  ForeColor="Red" ControlToValidate="txtPassword" 
                        ErrorMessage="must enter your Password"></asp:RequiredFieldValidator>
                    <div class="password-meter">
	  					<div class="password-meter-message">&nbsp;</div>
	  					<div class="password-meter-bg">
		  					<div class="password-meter-bar"></div>
	  					</div>
	  				</div>
    	
                </td>
            
            </tr>
            <tr ID="trRePassword" runat="server">
                <td ID="TableCell16" runat="server">
                    <label for="txtRePassword">Confirm Password</label>
                 
                </td>
                <td ID="TableCell17" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtRePassword" runat="server" Height="24"  Width="300" TextMode="Password" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                </td>
                <td ID="TableCell18" runat="server">
                    <asp:Label ID="errPwd" ForeColor="Red" runat="server" Visible="false"></asp:Label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtRePassword" ControlToCompare="txtPassword"
                         ForeColor="Red" ErrorMessage="Password mismatch"></asp:CompareValidator>
                </td>
            </tr>
            <tr ID="trEmail" runat="server">
                <td ID="TableCell19" runat="server">
                    <label for="txtEmail">Email Address</label>
                 
                </td>
                <td ID="TableCell20" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtEmail" runat="server" Height="24"  Width="300" TextMode="Email" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                    <asp:Label ID="lblErrorEmail" runat="server" ForeColor="Red" Text="Already exists" Visible="False"></asp:Label>
                 
                </td>
                <td ID="TableCell21" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="must enter your Email" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr ID="trMobile" runat="server">
                <td ID="TableCell22" runat="server">
                    <label for="txtMobile">Mobile</label>
                 
                </td>
                <td ID="TableCell23" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtMobile" runat="server" Height="24"  Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile" ForeColor="Red"
ErrorMessage="Please Enter Only Numbers"  ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
                <td ID="TableCell24" runat="server">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" ForeColor="Red"
                        ErrorMessage="must enter mobile no"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr ID="trAddress" runat="server">
                <td ID="TableCell25" runat="server">
                    <label for="txtAddress">Address</label>
                 
                </td>
                <td ID="TableCell26" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtAddress" runat="server" Height="24"  Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td ID="TableCell27" runat="server">
                    <span class="inline-notice" id="Span13">
                 </span>
                 <span class="inline-input-error-message" id="Span14"></span>
             
                </td>
            </tr>
            <tr ID="trStreetname" runat="server">
                <td ID="TableCell28" runat="server">
                    <label for="txtStreetname">Street name</label>
                 
                </td>
                <td ID="TableCell29" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtStreetname" runat="server" Height="24"  Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                 
                </td>
                <td ID="TableCell30" runat="server">
                    <span class="inline-notice" id="Span15">
                 </span>
                 <span class="inline-input-error-message" id="Span16"></span>
             
                </td>
            </tr>
            <tr ID="trCountry" runat="server">
                <td ID="TableCell31" runat="server">
                    <label for="ddlCountry">Country</label>
                 
                </td>
                <td ID="TableCell32" runat="server" class="auto-style1">
                    <asp:DropDownList ID="ddlCountry" Height="24px" Width="300" style="border:solid 1px"  runat="server"></asp:DropDownList>
                </td>
                <td ID="TableCell33" runat="server">
                    <span class="inline-notice" id="Span17">
                 </span>
                 <span class="inline-input-error-message" id="Span18"></span>
             
                </td>
            </tr>
            <tr ID="trState" runat="server">
                <td ID="TableCell34" runat="server">
                    <label for="ddlState">State</label>
                 
                </td>
                <td ID="TableCell35" runat="server" class="auto-style1">
                    <asp:DropDownList ID="ddlState" Height="24px" Width="300" style="border:solid 1px"  runat="server"></asp:DropDownList>
                </td>
                <td ID="TableCell36" runat="server">
                    <span class="inline-notice" id="Span19">
                 </span>
                 <span class="inline-input-error-message" id="Span20"></span>
             
                </td>
            </tr>
            <tr ID="trCity" runat="server">
                <td ID="TableCell37" runat="server">
                    <label for="ddlCity">City</label>
                 
                </td>
                <td ID="TableCell38" runat="server" class="auto-style1">
                    <asp:DropDownList ID="ddlCity" Height="24px" Width="300" style="border:solid 1px" runat="server"></asp:DropDownList>
                </td>
                <td ID="TableCell39" runat="server">
                    <span class="inline-notice" id="Span21">
                 </span>
                 <span class="inline-input-error-message" id="Span22"></span>
             
                </td>
            </tr>
            <tr ID="trZipcode" runat="server">
                <td ID="TableCell40" runat="server">
                    <label for="txtZipcode">Zip code</label>
                 
                </td>
                <td ID="TableCell41" runat="server" class="auto-style1">
                    <asp:TextBox ID="txtZipcode" Height="24px" Width="300" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td ID="TableCell42" runat="server">
                    <span class="inline-notice" id="Span23">
                 </span>
                 <span class="inline-input-error-message" id="Span24"></span>
             
                </td>
            </tr>
            <tr ID="trCheck" runat="server">
                <td ID="TableCell43" runat="server">
                 &nbsp;
                </td>
                <td ID="TableCell44" runat="server" class="auto-style1">
                    <asp:CheckBox ID="chkYardecart" runat="server" />
                    <label for="etsy_finds">Sign up for the YardeCart.</label>
                </td>
                <td ID="TableCell45" runat="server">
                    <asp:Label runat="server" ID="ErrCheck" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr ID="TableRow2" runat="server">
                <td ID="TableCell46" runat="server">
                 &nbsp;
                </td>
                <td ID="TableCell47" runat="server" class="auto-style1">
                 &nbsp;
                </td>
                <td ID="TableCell48" runat="server">
                    <span class="inline-notice" id="Span27">
                 </span>
                 <span class="inline-input-error-message" id="Span28"></span>
             
                </td>
            </tr>
            <tr ID="trRegister" runat="server">
                <td ID="TableCell49" runat="server">
                 &nbsp;
                </td>
                <td ID="TableCell50" runat="server" class="auto-style1">
                    <asp:Button ID="btnRegister" Width="100" runat="server" Text="Register" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" OnClick="btnRegister_Click" />
                </td>
                <td ID="TableCell51" runat="server">
                   <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Font-Bold="true"></asp:Label>
                     <span class="inline-notice" id="Span29">
                 </span>
                 <span class="inline-input-error-message" id="Span30"></span>
             
                </td>
            </tr>
        </table>
        </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 455px;
        }
    </style>
</asp:Content>