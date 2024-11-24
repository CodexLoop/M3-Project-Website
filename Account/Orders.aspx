<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <br />
        <br />
        <br />
        <br />


        <h1 style="font-size: 60px;">Order History</h1>
        <p>View your order history</p>
        <br />
        <asp:TextBox ID="UserIDTxtBox" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OrderID], [DateTime], [ProdName], [Quantity], [ProdPrice] FROM [Orders] WHERE ([UserID] = @UserID) ORDER BY [DateTime]">
            <SelectParameters>
                <asp:ControlParameter ControlID="UserIDTxtBox" Name="UserID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
