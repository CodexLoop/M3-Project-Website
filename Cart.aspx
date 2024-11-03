<%@ Page Title="Townbush | Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Townbush_Pharmacy_Website.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

        <h1 style="font-size: 78px;">Cart.</h1>
        <br/ />

     <!-- Login message and link to login page -->
    <asp:Label ID="LoginMessage" runat="server" Visible="true" ForeColor="Red"></asp:Label>
    <asp:LinkButton ID="LoginLinkButton" runat="server" Visible="false" PostBackUrl="~/Account/Login.aspx" OnClick="LoginLinkButton_Click">Click here to log in</asp:LinkButton>


    <asp:Button ID="Button2" runat="server" Text="Continue Shopping" OnClick="Button2_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your cart is empty." OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
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
    <br/ />
    <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
    <br/ />
    <br/ />
    <br/ />
    <asp:Label ID="TotalAmountLabel" runat="server" Text="Total Amount: R"></asp:Label>
</asp:Content>
