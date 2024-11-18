<%@ Page Title="Townbush | Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Townbush_Pharmacy_Website.Cart" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <webopt:BundleReference runat="server" Path="~/Custom_CSS/tablestyle.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="cart__section" style="background: url(Resources/twoBags.jpg) center/cover;">

        <br />
        <br />
        <br />
        <br />



        <!-- Login message and link to login page -->
        <asp:Label ID="LoginMessage" runat="server" Visible="true" ForeColor="Red"></asp:Label>
        <asp:LinkButton ID="LoginLinkButton" runat="server" Visible="false" PostBackUrl="~/Account/Login.aspx" OnClick="LoginLinkButton_Click">Click here to log in</asp:LinkButton>

        <br />

        <main class="table">
            <section class="table__header">
                <h1>Your Orders</h1>
            </section>

            <section class="table__body">
                <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your cart is empty." OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ProdID" HeaderText="ID" />
                        <asp:BoundField DataField="ProdName" HeaderText="Name" />
                        <asp:BoundField  DataField="ProdPrice"  HeaderText="Price" />
                        <asp:ImageField DataImageUrlField="ProdID" HeaderText="Product" DataImageUrlFormatString="~/Resources/{0}.png"></asp:ImageField>
                        <asp:TemplateField HeaderText="Quantity">
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
                        <asp:BoundField DataField="SubTotal" DataFormatString="{0:c}" HeaderText="SubTotal" />
                        <asp:ButtonField ButtonType="Button" CommandName="Remove" Text="Remove" />
                    </Columns>
                </asp:GridView>
            </section>

            <div style="text-align: center; position: fixed; bottom: .5rem; left: 1rem;">
                <div style="cursor:pointer; margin-right:2rem; float:left;">
                    <asp:Button ID="Button1" Style="cursor:pointer; background-color: transparent; border: none; color: #400; font-weight: 700; font-family: 'Poppins', sans-serif; font-size: 16px;" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
                    <i style="transform: translateY(3px); color: #400; font-weight: 700" class='bx bx-right-arrow-alt button-icon'></i>
                </div>

                <asp:Label ID="TotalAmountLabel" Style="color:rgb(36,36,36); font-weight: 500; font-size: 16px;" runat="server" Text="Total Amount: R"></asp:Label>
            </div>
        </main>

        <%--<asp:Button ID="Button2" runat="server" Text="Continue Shopping" OnClick="Button2_Click" />--%>
        <br />
        <br />
        <br />
        <br />
    </section>
</asp:Content>
