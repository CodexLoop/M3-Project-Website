<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeViewOrders.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Orders_Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                    <br /><br /><br /><br /><br />

    <div class="container">
                <h1>Orders</h1>
        
        <asp:Label ID="LabelOrderID" runat="server" Text="Enter Order ID: "></asp:Label>
<%--        <asp:TextBox ID="SearchTextBox1" runat="server" Width="281px"></asp:TextBox>--%>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDSSearchOrder" DataTextField="OrderID" DataValueField="OrderID"></asp:DropDownList>
        <asp:Button ID="SearchButton1" runat="server" Text="Search" Width="180px" OnClick="SearchButton1_Click" />
        <asp:Button ID="ClearSearchButton1" runat="server" Text="Clear Search" Width="180px" OnClick="ClearSearchButton1_Click" />
        <asp:SqlDataSource ID="SqlDSSearchOrder" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
        <br/>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDSOrders" ForeColor="Black" Width="1021px" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                <asp:BoundField DataField="ProdID" HeaderText="Product ID" SortExpression="ProdID" />
                <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ProdPrice" HeaderText="Product Price" SortExpression="ProdPrice" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
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
        <asp:SqlDataSource ID="SqlDSOrders" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
            </div>




</asp:Content>
