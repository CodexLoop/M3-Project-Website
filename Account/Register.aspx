<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Register" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- This CSS is only applied to this page -->
        <webopt:bundlereference runat="server" path="~/Content/css" />

     <style>
        /* Ensure that the main content has enough space at the bottom to avoid overlapping with footer */
        body, html {
            height: 100%;
        }

        /* Flex layout for main content to take remaining space without overlapping footer */
        body {
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
            margin-bottom: 50px; /* Adjust this to ensure enough space above the footer */
        }

        /* Additional styling for confirmation panel */
        .confirmation-panel {
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #f7f7f7;
            margin-top: 20px;
        }
        .text-info {
            color: #5bc0de;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <div class="container">
            <br><br><br><br><br><br>

        <h2 id="title"><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <h4>Create a new account</h4>
        <hr />
                        <!-- Confirmation Panel - Initially Hidden -->
            <asp:Panel ID="ConfirmationPanel" runat="server" Visible="false" CssClass="confirmation-panel">
                <asp:Label ID="ConfirmMessage" runat="server" Text="" CssClass="text-info"></asp:Label>
                <br /><br />
                <asp:Button ID="ConfirmYesButton" runat="server" Text="Yes, this is me" OnClick="ConfirmYesButton_Click" CssClass="btn btn-primary" />
                <asp:Button ID="ConfirmNoButton" runat="server" Text="No, this is not me" OnClick="ConfirmNoButton_Click" CssClass="btn btn-secondary" />
            </asp:Panel>
            <!-- End of Confirmation Panel -->

        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="row">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 col-form-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="row">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="row">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
            <br />
        <div class="row">
            <div class="offset-md-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-outline-dark" />
            </div>
        </div>

        </div>
    </main>
     <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
         <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
     <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
     <br /><br /><br />     <br /><br /><br />     <br /><br /><br />


</asp:Content>
