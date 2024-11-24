<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prescriptions.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Prescriptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <br />
        <br />
        <br />
        <br />

        <h1 style="font-size: 60px;">Upload Prescriptions</h1>
        <p>Please upload your prescription in PDF format.</p>
        <br />
        <br />

        <asp:Panel runat="server" ID="UploadPanel">
            <asp:FileUpload runat="server" ID="PrescriptionUpload" AllowMultiple="false" />
            <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" />
        </asp:Panel>

        <asp:Label runat="server" ID="SuccessMessage" CssClass="text-success" Visible="false"></asp:Label>

        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
