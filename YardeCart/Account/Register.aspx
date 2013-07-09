<%@ Page Title="Register" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YardeCart.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="../CSS/FormValidation.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/jquery.validate.password.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" >
        $(document).ready(function() {
           // $("input[id$='txtUsername']").
            //if ($("input[id$='txtUsername']").val() != $("input[id$='txtUsername']").val())
              //  $("input[id$='errPwd']").val("mismatch");
        
        });
    </script>
    
        <div class="divHeadForm" style="color: #CC0066; font-family: 'Times New Roman'; font-size: x-large; background-color: #99CCFF; font-variant: ; text-align: center; vertical-align: top;">Registeration form</div>
        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" GridLines="Horizontal" BackColor="#B5F0C8" Height="510px" Width="630px">
            <asp:TableRow runat="server" ID="trUsername">
                <asp:TableCell runat="server">
                    <label for="txtUsername">User Name</label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="txtUsername" runat="server" Height="15" Width="200" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell runat="server">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidateRequestMode="Disabled" CausesValidation="False">Check avaiilablity</asp:LinkButton>
                        <asp:Image ID="imgNotAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/unchecked.gif" />
                        <asp:Image ID="imgAvailable" runat="server"  Visible="false" ImageAlign="Left" ImageUrl="~/Images/checked.gif" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trFirstname" runat="server">
                <asp:TableCell ID="TableCell1" runat="server">
                    <label for="txtFirstname">First Name</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server">
                    <asp:TextBox ID="txtFirstname" runat="server" Height="15" Width="200"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtFirstname" runat="server" CssClass="error" ControlToValidate="txtFirstname" ErrorMessage="must enter your First name"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trLastname" runat="server">
                <asp:TableCell ID="TableCell4" runat="server">
                    <label for="txtLastname">Last Name</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server">
                    <asp:TextBox ID="txtLastname" runat="server" Height="15" Width="200"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtLastname" runat="server" CssClass="error" ControlToValidate="txtLastname" ErrorMessage="must enter your Last name"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trGender" runat="server">
                <asp:TableCell ID="TableCell7" runat="server">
                    <label for="gender">Gender</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell8" runat="server" >
                    <div class="divOption" style="width:200px;"  >
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" TextAlign="right" >
                                        <asp:ListItem Selected="True" Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                        <asp:ListItem Value="0">Rather not say</asp:ListItem>
                                    </asp:RadioButtonList>
                        </div>
                    <%--<asp:RadioButton ID="rdoFemale" runat="server" Text="Female"  TextAlign="Left" />
                    <asp:RadioButton ID="rdoMale" runat="server" Text="Male" TextAlign="Right" />
                    <asp:RadioButton ID="rdoRather" runat="server" Text="Rather not say" TextAlign="Right" />--%>
                </asp:TableCell>
                <asp:TableCell ID="TableCell9" runat="server">
                    <span class="inline-notice" id="Span5">
                 </span>
                 <span class="inline-input-error-message" id="Span6"></span>
             
                </asp:TableCell>
            
            </asp:TableRow>
            <asp:TableRow ID="trPassword" runat="server">
                <asp:TableCell ID="TableCell10" runat="server">
                    <label for="txtPassword">Password</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell11" runat="server">
                    <asp:TextBox ID="txtPassword" runat="server" Height="15" Width="200" TextMode="Password"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell12" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtPassword" runat="server" CssClass="error" ControlToValidate="txtPassword" ErrorMessage="must enter your Password"></asp:RequiredFieldValidator>

                    <div class="password-meter">
	  					<div class="password-meter-message">&nbsp;</div>
	  					<div class="password-meter-bg">
		  					<div class="password-meter-bar"></div>
	  					</div>
	  				</div>
    	
                </asp:TableCell>
            
            </asp:TableRow>
            <asp:TableRow ID="trRePassword" runat="server">
                <asp:TableCell ID="TableCell13" runat="server">
                    <label for="txtRePassword">Confirm Password</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell14" runat="server">
                    <asp:TextBox ID="txtRePassword" runat="server" Height="15" Width="200" TextMode="Password"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell15" runat="server">
                    <asp:Label ID="errPwd" CssClass="error" runat="server" Visible="false"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trEmail" runat="server">
                <asp:TableCell ID="TableCell16" runat="server">
                    <label for="txtEmail">Email Address</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell17" runat="server">
                    <asp:TextBox ID="txtEmail" runat="server" Height="15" Width="200"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell18" runat="server">
                    <asp:RequiredFieldValidator ID="valtxtEmail" runat="server" CssClass="error" ControlToValidate="txtEmail" ErrorMessage="must enter your Email"></asp:RequiredFieldValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trMobile" runat="server">
                <asp:TableCell ID="TableCell19" runat="server">
                    <label for="txtMobile">Mobile</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell20" runat="server">
                    <asp:TextBox ID="txtMobile" runat="server" Height="15" Width="200"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell21" runat="server">
                    <span class="inline-notice" id="Span11">
                 </span>
                 <span class="inline-input-error-message" id="Span12"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trAddress" runat="server">
                <asp:TableCell ID="TableCell22" runat="server">
                    <label for="txtAddress">Address</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell23" runat="server">
                    <asp:TextBox ID="txtAddress" runat="server" Height="15" Width="200"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell ID="TableCell24" runat="server">
                    <span class="inline-notice" id="Span13">
                 </span>
                 <span class="inline-input-error-message" id="Span14"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trStreetname" runat="server">
                <asp:TableCell ID="TableCell25" runat="server">
                    <label for="txtStreetname">Street name</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell26" runat="server">
                    <asp:TextBox ID="txtStreetname" runat="server" Height="15" Width="200"></asp:TextBox>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell27" runat="server">
                    <span class="inline-notice" id="Span15">
                 </span>
                 <span class="inline-input-error-message" id="Span16"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trCountry" runat="server">
                <asp:TableCell ID="TableCell28" runat="server">
                    <label for="ddlCountry">Country</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell29" runat="server">
                    <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="TableCell30" runat="server">
                    <span class="inline-notice" id="Span17">
                 </span>
                 <span class="inline-input-error-message" id="Span18"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trState" runat="server">
                <asp:TableCell ID="TableCell31" runat="server">
                    <label for="ddlState">State</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell32" runat="server">
                    <asp:DropDownList ID="ddlState" runat="server"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="TableCell33" runat="server">
                    <span class="inline-notice" id="Span19">
                 </span>
                 <span class="inline-input-error-message" id="Span20"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trCity" runat="server">
                <asp:TableCell ID="TableCell34" runat="server">
                    <label for="ddlCity">City</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell35" runat="server">
                    <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="TableCell36" runat="server">
                    <span class="inline-notice" id="Span21">
                 </span>
                 <span class="inline-input-error-message" id="Span22"></span>
             
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trZipcode" runat="server">
                <asp:TableCell ID="TableCell37" runat="server">
                    <label for="txtZipcode">Zip code</label>
                 
                </asp:TableCell>
                <asp:TableCell ID="TableCell38" runat="server">
                    <asp:TextBox ID="txtZipcode" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell ID="TableCell39" runat="server">
                    <span class="inline-notice" id="Span23">
                 </span>
                 <span class="inline-input-error-message" id="Span24"></span>
             
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="trCheck" runat="server">
                <asp:TableCell ID="TableCell40" runat="server">
                 &nbsp;
                </asp:TableCell>
                <asp:TableCell ID="TableCell41" runat="server">
                    <asp:CheckBox ID="chkYardecart" runat="server" />
                    <label for="etsy_finds">Sign up for the YardeCart.</label>
                </asp:TableCell>
                <asp:TableCell ID="TableCell42" runat="server">
                    <span class="inline-notice" id="Span25">
                 </span>
                 <span class="inline-input-error-message" id="Span26"></span>
             
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell ID="TableCell43" runat="server">
                 &nbsp;
                </asp:TableCell>
                <asp:TableCell ID="TableCell44" runat="server">
                 &nbsp;
                </asp:TableCell>
                <asp:TableCell ID="TableCell45" runat="server">
                    <span class="inline-notice" id="Span27">
                 </span>
                 <span class="inline-input-error-message" id="Span28"></span>
             
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="trRegister" runat="server">
                <asp:TableCell ID="TableCell46" runat="server">
                 &nbsp;
                </asp:TableCell>
                <asp:TableCell ID="TableCell47" runat="server">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" BackColor="PeachPuff" OnClick="btnRegister_Click" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell48" runat="server">
                    <span class="inline-notice" id="Span29">
                 </span>
                 <span class="inline-input-error-message" id="Span30"></span>
             
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>