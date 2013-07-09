<%@ Page Title="Yard-eCart View Posted Ads" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="ViewPostedAd.aspx.cs" Inherits="YardeCart.ViewPostedAd" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">


        <div class="main_resize"> 

            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" Height="400px" Width="800px" AllowPaging="false" 
                    AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" 
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
            </div>
</asp:Content>
