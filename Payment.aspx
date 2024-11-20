<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Townbush_Pharmacy_Website.Payment" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <webopt:BundleReference runat="server" Path="~/Custom_CSS/formstyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="orders__body">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <div class="orders__container">
            <div class="text">Bank Card Details</div>
            <br />
            <br />
            <asp:Label CssClass="payment" ID="lblTotalToPay" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Label ID="CardNoLbl" runat="server" Text="Card Number: "></asp:Label>
            <asp:TextBox ID="CardNotxtbx" runat="server" MaxLength="16"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="ExpDateLbl" runat="server" Text="Expiry Date: "></asp:Label>
            <asp:TextBox ID="ExpDateTxtBx" runat="server" MaxLength="5"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="CVVLbl" runat="server" Text="CVV: "></asp:Label>
            <asp:TextBox ID="CVVTxtBx" runat="server" MaxLength="3"></asp:TextBox>
            <br />
            <br />
            <asp:Button CssClass="pay__btn" ID="MakePayBtn" runat="server" Text="Pay" OnClick="MakePayBtn_Click" Style="height: 33px" />
            <br />
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
