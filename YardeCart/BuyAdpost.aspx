<%@ Page Title="Yard e-Cart Buy Ad" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="BuyAdpost.aspx.cs" Inherits="YardeCart.BuyAdpost" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="css/flexslider.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.8.2-min.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/jquery.flexslider.js"></script>
    
    <link rel="stylesheet" type="text/css" href="css/rating.css" />
    <script type="text/javascript" src="Scripts/rating.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            InitializeImageSlider();
        });
        function InitializeImageSlider() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: true,
                directionNav: true,
                itemWidth: "100%",
                itemHeight: 400,
                width: 500
            });
        }
        $(function () {                   // Start when document ready
            $('#star-rating').rating(); // Call the rating plugin
        });
    </script>
    <style type="text/css">
        .error, .notice, .success
        {
            padding: .8em;
            margin-bottom: 1em;
            border: 2px solid #ddd;
        }
        .error
        {
            background: #FBE3E4;
            color: #8a1f11;
            border-color: #FBC2C4;
        }
        .notice
        {
            background: #FFF6BF;
            color: #514721;
            border-color: #FFD324;
        }
        .success 
        {
            background: #E6EFC2;
            color: #264409;
            border-color: #C6D880;
        }
        .error a
        {
            color: #8a1f11;
        }
        .notice a
        {
            color: #514721;
        }
        .success a
        {
            color: #264409;
        }
    </style>
    <div id="form-content" style="vertical-align:central;padding-top:50px;">
    
    <table style="width:700px;padding-left:10px;border:groove;border-color:ActiveBorder; " border="1">
        
        <tr>
            <td colspan="2" style="font-size:large;font-weight:700;" >
                <span><asp:Label runat="server" ID="lblTitle" Text="Ad Post" ForeColor="Maroon"></asp:Label></span>

            </td>

            <td style="text-align:right;width:200PX;">
                   <asp:Button ID="btnAddCart" Width="150" runat="server" Text="ADD TO CART" BorderStyle="Groove" BorderWidth="1px" OnClick="btnAddCart_Click"  />

            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style2" style="text-align:left;animation-fill-mode:backwards;font-stretch:expanded;font-size:larger;">
                    <asp:Label ID="lblCategory" runat="server" Font-Bold="True" ForeColor="BurlyWood" ></asp:Label>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            
        <tr>
            <td colspan="3" style="text-align:center;">
    <div class="banner1 grid_24 clearfix banner-1-chrome">
        <div id="divImageSlider" class="flexslider" runat="server">
    </div>

    </div></td>
        </tr>
        
            <tr>
                <td class="auto-style2" colspan="3">
                    <h4>Ad Description:</h4>
                <br />
                    <asp:Label ID="lblAddesc" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align:center;animation-fill-mode:backwards;font-stretch:expanded;font-size:larger;">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" ForeColor="#00CC00" ></asp:Label>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            
            
            <tr>
                <td class="auto-style2" colspan="3" style="vertical-align:central;text-align:center;">
                    <span id="spnVideo" runat="server"></span>


                </td>
            </tr>
            
            <tr>
                <td class="auto-style2" colspan="3" style="vertical-align:central;text-align:center;">
                    <asp:Button ID="btnBuy" Width="100" runat="server" Text="BUY" BorderStyle="Groove" BorderWidth="1px" Visible="false" OnClick="btnBuy_Click" />

                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3" style="vertical-align:central;text-align:center;">
                    Vote Ad:<br />
                    <div id="star-rating">
                    <input type="radio" name="example" class="rating" value="1" />
                    <input type="radio" name="example" class="rating" value="2" />
                    <input type="radio" name="example" class="rating" value="3" />
                    <input type="radio" name="example" class="rating" value="4" />
                    <input type="radio" name="example" class="rating" value="5" />
                </div>
                </td>
            </tr>

    </table>

                </div>
</asp:Content>