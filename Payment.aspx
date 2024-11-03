<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Townbush_Pharmacy_Website.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

        <h1 style="font-size: 78px;">Payment</h1>
        <br/ />
    <br/ />
    <asp:Label ID="lblTotalToPay" runat="server" Text="Label"></asp:Label>
    <br/ />
    <br/ />
    <asp:Label ID="CardNoLbl" runat="server" Text="Card Number: "></asp:Label>
    <asp:TextBox ID="CardNotxtbx" runat="server" MaxLength="16"></asp:TextBox>
    <br/ />
    <br/ />
    <asp:Label ID="ExpDateLbl" runat="server" Text="Expiry Date: "></asp:Label>
    <asp:TextBox ID="ExpDateTxtBx" runat="server" MaxLength="5"></asp:TextBox>
    <br/ />
    <br/ />
    <asp:Label ID="CVVLbl" runat="server" Text="CVV: "></asp:Label>
    <asp:TextBox ID="CVVTxtBx" runat="server" MaxLength="3"></asp:TextBox>
    <br/ />
    <br/ />
    <asp:Button ID="MakePayBtn" runat="server" Text="Pay" OnClick="MakePayBtn_Click" style="height: 33px" />
    <br//>
    <br/ />
    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
</asp:Content>
