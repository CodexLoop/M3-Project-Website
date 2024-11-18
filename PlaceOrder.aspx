<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="Townbush_Pharmacy_Website.PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />


    <%--<h1 style="font-size: 78px;">Place Order</h1>--%>

    <br />
    <asp:Label ID="Namelbl" runat="server" Text="First Name: "></asp:Label>
    <asp:TextBox ID="NametxtBx" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="SurnameLbl" runat="server" Text="Surname: "></asp:Label>
    <asp:TextBox ID="SurnameTxtBx" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="EmailLbl" runat="server" Text="Email: "></asp:Label>
    <asp:TextBox ID="EmailTxtBx" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="PhoneLbl" runat="server" Text="Phone Number: "></asp:Label>
    <asp:TextBox ID="PhoneTxtBx" runat="server"></asp:TextBox>
    <asp:Label ID="PkLbl" runat="server" Text="Pick-Up"></asp:Label>
    <asp:DropDownList ID="ddlShippingMethod" runat="server" OnSelectedIndexChanged="ddlShippingMethod_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Text="Select Shipping Method" Value="" />
        <asp:ListItem Text="Pick-up" Value="0" />
        <asp:ListItem Text="Delivery" Value="1" />
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Addlbl" runat="server" Text="Address: " Visible="False"></asp:Label>
    <asp:TextBox ID="AddTxtBx" runat="server" Visible="False"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Citylbl" runat="server" Text="City: " Visible="False"></asp:Label>
    <asp:TextBox ID="CityTxtBx" runat="server" Visible="False"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="PClbl" runat="server" Text="Postal Code: " Visible="False"></asp:Label>
    <asp:TextBox ID="PCTxtBx" runat="server" Visible="False"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="ProvLbl" runat="server" Text="Province: " Visible="False"></asp:Label>
    <asp:DropDownList ID="ddlProv" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProv_SelectedIndexChanged">
        <asp:ListItem Text="Select Province" />
        <asp:ListItem Text="Gauteng" Value="100" />
        <asp:ListItem Text="Western Cape" Value="175" />
        <asp:ListItem Text="KwaZulu-Natal" Value="50" />
        <asp:ListItem Text="Limpopo" Value="120" />
        <asp:ListItem Text="Northern Cape" Value="150" />
        <asp:ListItem Text="Mpumalanga" Value="160" />
        <asp:ListItem Text="Free State" Value="75" />
        <asp:ListItem Text="Eastern Cape" Value="130" />
        <asp:ListItem Text="North-West" Value="200" />
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Button ID="PayBtn" runat="server" Text="Proceed to Payment" OnClick="PayBtn_Click" />
    <br />
    <br />
    <br />

    <div <%--style="float: right; width: 40%"--%>>
        <asp:Label ID="TotalAmountLabel" runat="server" Text="Total Amount: "></asp:Label>
        <br />
        <br />
        <asp:Label ID="ShipLbl" runat="server" Text="Label"></asp:Label>
        <br />
        <br />

    </div>
</asp:Content>

