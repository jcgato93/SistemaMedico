<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Home.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SistemaMedico.Views.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:5em;">
        <h1>Consultas</h1>

        <div class="col-md-12 col-lg-12 col-xs-12" style="padding-top:3rem">
    <div style="overflow-y:auto; overflow-x:auto; height:300px">
                <asp:GridView ID="gridConsultas" runat="server" AllowPaging="True" BackColor="White" BorderColor="#FBFCFC" BorderStyle="Solid" BorderWidth="1px" CellPadding="5"  CssClass="table table-responsive" Font-Size="Medium" OnPageIndexChanging="gridLeads_PageIndexChanging" OnSelectedIndexChanged="gridLeads_SelectedIndexChanged">
                     <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="select" InsertVisible="False" Text="➤" HeaderText="Select">
                            <ControlStyle CssClass="form-control" BackColor="#2874A6" Font-Bold="true" ForeColor="#F7F9F9"/>
                        </asp:ButtonField>                        
                    </Columns>
                                            
                    <FooterStyle BackColor="#F7F9F9" ForeColor="#F7F9F9" />
                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="#F7F9F9" CssClass="DataGridFixedHeader" />
                    <PagerStyle CssClass="gridViewPager" BackColor="#2874A6" ForeColor="#F7F9F9" HorizontalAlign="Center" Font-Bold="true" />
                    <RowStyle ForeColor="#337ab7" BackColor="White" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#F7F9F9" />
                    <SortedAscendingHeaderStyle BackColor="#F7F9F9" />
                    <SortedDescendingCellStyle BackColor="#F7F9F9" />
                    <SortedDescendingHeaderStyle BackColor="#F7F9F9" />
                </asp:GridView>   
    </div>
    </div>

    </div>


</asp:Content>
