<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="Townbush_Pharmacy_Website.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div border-style: solid; float: left; width: 50%;">
        <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="Product Description" SortExpression="ProdDescription" />
                <asp:BoundField DataField="Dosage" HeaderText="Dosage" SortExpression="Dosage" />
                <asp:CheckBoxField DataField="isPrescriptionMed" HeaderText="is Prescription Med" SortExpression="isPrescriptionMed" />
                <asp:BoundField DataField="QtyInStock" HeaderText="QtyInStock" SortExpression="QtyInStock" />
                <asp:BoundField DataField="ReorderPoint" HeaderText="ReorderPoint" SortExpression="ReorderPoint" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
    </div>

</asp:Content>

