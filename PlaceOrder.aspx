<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="Townbush_Pharmacy_Website.PlaceOrder" %>

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
            <div class="text">Checkout Form</div>

            <div class="form-row">
                <div class="input-data">
                    <%--<asp:Label ID="Namelbl" runat="server" Text="First Name: "></asp:Label>--%>
                    <asp:TextBox ID="NametxtBx" runat="server" BorderStyle="None"></asp:TextBox>
                    <div class="underline"></div>
                    <label>First Name</label>
                </div>

                <div class="input-data">
                    <%--<asp:Label ID="SurnameLbl" runat="server" Text="Surname: "></asp:Label>--%>
                    <asp:TextBox ID="SurnameTxtBx" runat="server"></asp:TextBox>
                    <div class="underline"></div>
                    <label>Last Name</label>
                </div>
            </div>


            <div class="form-row">
                <div class="input-data">
                    <%--<asp:Label ID="EmailLbl" runat="server" Text="Email: "></asp:Label>--%>
                    <asp:TextBox ID="EmailTxtBx" runat="server" ReadOnly="True"></asp:TextBox>
                    <div class="underline"></div>
                    <%--<label>Email Address</label>--%>
                </div>

                <div class="input-data">
                    <%--<asp:Label ID="PhoneLbl" runat="server" Text="Phone Number: "></asp:Label>--%>
                    <asp:TextBox ID="PhoneTxtBx" runat="server"></asp:TextBox>
                    <div class="underline"></div>
                    <label>Phone</label>
                </div>
            </div>

            <div class="form-row">
                <div class="input-data">
                    <%--<asp:Label ID="PkLbl" runat="server" Text="Pick-Up"></asp:Label>--%>
                    <asp:DropDownList ID="ddlShippingMethod" runat="server" OnSelectedIndexChanged="ddlShippingMethod_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="Select Shipping Method" Value="" />
                        <asp:ListItem Text="Pick-up" Value="0" />
                        <asp:ListItem Text="Delivery" Value="1" />
                    </asp:DropDownList>
                    <span>Shipping Method</span>
                    <div class="underline"></div>
                </div>
            </div>

            <div style="display: block;">
                <asp:Label ID="Addlbl" runat="server" Text="Address: " Visible="False"></asp:Label>
                <asp:TextBox ID="AddTxtBx" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="Citylbl" runat="server" Text="City: " Visible="False"></asp:Label>
                <asp:TextBox ID="CityTxtBx" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="PClbl" runat="server" Text="Postal Code: " Visible="False"></asp:Label>
                <asp:TextBox ID="PCTxtBx" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="ProvLbl" runat="server" Text="Province: " Visible="False"></asp:Label>
            </div>

            <div class="input-data">
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
                <div class="underline"></div>
            </div>

            <div class="form-row submit-btn">
                <div class="input-data">
                    <div class="inner"></div>
                    <asp:Button ID="PayBtn" runat="server" Text="submit" OnClick="PayBtn_Click" />
                </div>
            </div>

            <div>
                <asp:Label ID="TotalAmountLabel" runat="server" Text="Total Amount: "></asp:Label>
                <asp:Label ID="ShipLbl" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

