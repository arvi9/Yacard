<%@ Page Title="ViewPostedAd" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ViewPostedAd.aspx.cs" Inherits="YardeCart.ViewPostedAd" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">


        <div class="main_resize"> 
      <!--start slider code DC Flick Slider Start -->
      <%--<div style="width: 111%; margin:0 auto; padding: 10px 0; position:relative; top: 0px; left: -50px; background-color: #99CCFF;"> 
        
        <!-- navigation controls-->
        <div class="navig-photo-stack ps"> <a class="prev"></a> <a class="next"></a> </div>
        <section id="slide">
          <div id="ps-slider" class="ps-slider"> 
            <!-- Slide 1 -->
            <div id="ps-albums"> 
              
              <!-- sample local image:
                <div class="ps-album" style="opacity:0;"> <img src="dcodes/sliders/images/flick/226x420-image.jpg" width="226" height="420" /> -->
              <div class="ps-album" style="opacity:0;"> <img src="http://cdn.pimg.co/p/210x420/999999/fff/img.png" />
                <div class="ps-desc">
                  <div class="ps-head">
                    <h3>dCodes</h3>
                  </div>
                  <div class="ps-cont"> <span> Vel vitae aptent velit emagna in molestienec. torquent vehicula. Nonummy a velit</span> </div>
                </div>
              </div>
              
            </div>
            <!-- /ps-albums -->
          </div>
          <!-- /ps-slider --> 
          
        </section>
        <!-- /section slide --> 
      </div>--%>

            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" Height="400px" Width="800px" AllowPaging="true" 
                    AutoGenerateColumns="False" BackColor="#99FFCC" OnRowDataBound="GridView1_RowDataBound" 
                    PageSize="1" ShowHeader="False" OnPageIndexChanging="GridView1_PageIndexChanging"
                    
                    >

                    <Columns>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml0" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml1" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml2" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <span id="spnHtml3" runat="server"></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                </asp:GridView>
            </asp:Panel>
      <!--end slider code DC Flick Slider Start --> 

</asp:Content>
