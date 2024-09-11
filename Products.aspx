﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Townbush_Pharmacy_Website.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        
        <br /><br /><br /><br /><br /><br /><br /><br /><br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [ProdName], [ProdDescription], [Form], [ProdPrice] FROM [Product]" ConnectionString="Data Source=146.230.177.46;Initial Catalog=G2Pmb2024;User ID=G2Pmb2024;Password=j0210j;TrustServerCertificate=True"></asp:SqlDataSource>

        <div id="prod_list">
            <h1>Products list</h1>
            
            <br />

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CellPadding="5" BorderStyle="Solid" BorderWidth="4px" BorderColor="#333333" AlternatingRowStyle-BackColor="WhiteSmoke" EditRowStyle-BorderStyle="Solid" EditRowStyle-BorderColor="#333333" Font-Italic="True" GridLines="Vertical" HeaderStyle-BackColor="WhiteSmoke" HeaderStyle-BorderWidth="4">
                <Columns>
                    <asp:BoundField DataField="ProdName" HeaderText="Product" ReadOnly="True" SortExpression="ProdName">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Height="30px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ProdDescription" HeaderText="Description" ReadOnly="True" SortExpression="ProdDescription">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Form" HeaderText="Form" ReadOnly="True" SortExpression="Form">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom"></HeaderStyle>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ProdPrice" DataFormatString="{0:C}" HeaderText="Price" ReadOnly="True" SortExpression="ProdPrice">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:ButtonField CommandName="Select" Text="Add to cart" ShowHeader="True" HeaderText="Buy"><HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="150px"></ItemStyle>
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
            
        </div>

        <br /><br /><br /><br /><br /><br /><br /><br /><br />

    </div>
</asp:Content>
