<%@ Page Title="Townbush | Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Townbush_Pharmacy_Website.Cart" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <webopt:bundlereference runat="server" path="~/Custom_CSS/tablestyle.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <!-- Login message and link to login page -->
    <asp:Label ID="LoginMessage" runat="server" Visible="true" ForeColor="Red"></asp:Label>
    <asp:LinkButton ID="LoginLinkButton" runat="server" Visible="false" PostBackUrl="~/Account/Login.aspx" OnClick="LoginLinkButton_Click">Click here to log in</asp:LinkButton>

    <asp:Button ID="Button2" runat="server" Text="Continue Shopping" OnClick="Button2_Click" />
    
    <br />
    <br />
    <br />

    <main class="table">
        <section class="table__header">
            <h1>Your Orders</h1>
        </section>

        <section class="table__body">
        <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your cart is empty." OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="ProdID" HeaderText="Product ID" />
                <asp:BoundField DataField="ProdName" HeaderText="Product" />
                <asp:BoundField DataField="ProdPrice" HeaderText="Price" />
                <asp:ImageField DataImageUrlField="ProdID" DataImageUrlFormatString="~/Pictures/{0}.jpg" ControlStyle-Width="150px">
                    <ControlStyle Width="150px"></ControlStyle>
                </asp:ImageField>
                <asp:TemplateField HeaderText="Qty">
                    <ItemTemplate>
                        <asp:DropDownList ID="Qty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Qty_SelectedIndexChanged">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" />
                <asp:ButtonField ButtonType="Button" CommandName="Remove" Text="Remove" />
            </Columns>
        </asp:GridView>
        </section>
    </main>

    <br />
    <br />
    <br />

    <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="TotalAmountLabel" runat="server" Text="Total Amount: R"></asp:Label>
</asp:Content>
