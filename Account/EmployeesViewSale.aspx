<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesViewSale.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.EmployeesViewSale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                    <br /><br /><br /><br /><br />

<div class="container">
            <h1>Sales</h1>
            <asp:Label ID="LabelOrderID" runat="server" Text="Enter Order ID: "></asp:Label>
<%--        <asp:TextBox ID="SearchTextBox1" runat="server" Width="281px"></asp:TextBox>--%>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDSSearchSales" DataTextField="OrderID" DataValueField="OrderID"></asp:DropDownList>
        <asp:Button ID="SearchButton1" runat="server" Text="Search" Width="180px" OnClick="SearchButton1_Click" />
        <asp:Button ID="ClearSearchButton1" runat="server" Text="Clear Search" Width="180px" OnClick="ClearSearchButton1_Click" />
        <asp:SqlDataSource ID="SqlDSSearchSales" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [OnlineSales]"></asp:SqlDataSource>
        <br/>


    <asp:GridView ID="GVSales" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDSSales" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="SalesID" HeaderText="SalesID" InsertVisible="False" ReadOnly="True" SortExpression="SalesID" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
            <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
            <asp:BoundField DataField="TotalAmt" HeaderText="TotalAmt" SortExpression="TotalAmt" />
            <asp:BoundField DataField="Receipt" HeaderText="Receipt" SortExpression="Receipt" />
        </Columns>
            <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
    <asp:SqlDataSource ID="SqlDSSales" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [OnlineSales]"></asp:SqlDataSource>
    </div>
</asp:Content>
