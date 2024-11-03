<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Townbush_Pharmacy_Website.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        
        <br /><br /><br /><br /><br /><br /><br /><br /><br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString  %>" SelectCommand="SELECT * FROM [Product] WHERE ([isPrescriptionMed] = @isPrescriptionMed)">
            <SelectParameters>
                <asp:Parameter DefaultValue="FALSE" Name="isPrescriptionMed" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div id="prod_list">
            <h1>Products list</h1>
            
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CellPadding="5" BorderStyle="Solid" BorderWidth="4px" BorderColor="#333333" AlternatingRowStyle-BackColor="WhiteSmoke" EditRowStyle-BorderStyle="Solid" EditRowStyle-BorderColor="#333333" Font-Italic="True" GridLines="Vertical" HeaderStyle-BackColor="WhiteSmoke" HeaderStyle-BorderWidth="4" DataKeyNames="ProdID" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" Width="799px" AllowPaging="True">
<AlternatingRowStyle BackColor="WhiteSmoke"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                    <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                    <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                    <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                    <asp:BoundField DataField="QtyInStock" HeaderText="QtyInStock" SortExpression="QtyInStock" Visible="False" />
                    <asp:ImageField DataImageUrlField="ProdID" DataImageUrlFormatString="~/Pictures/{0}.jpg" ControlStyle-Width ="150px">
<ControlStyle Width="150px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Add To Cart">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Add to Cart" CommandName="BtnClick" CommandArgument='<%# Eval("ProdID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<EditRowStyle BorderColor="#333333" BorderStyle="Solid"></EditRowStyle>

<HeaderStyle BackColor="WhiteSmoke" BorderWidth="4px"></HeaderStyle>
            </asp:GridView>
            
        </div>

        <br /><br /><br /><br /><br /><br /><br /><br /><br />

    </div>

    <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
<br /><br /><br />     <br /><br /><br />     <br /><br /><br />
    <br />
    <br />

        <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
<br /><br /><br />     <br /><br /><br />     <br /><br /><br />
</asp:Content>
