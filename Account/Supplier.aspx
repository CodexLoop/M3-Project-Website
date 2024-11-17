<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Supplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class ="container">
                        <br /><br /><br /><br /><br /><br /><br /><br /><br />
                        <br /><br /><br />
        <asp:Label ID="Label1" runat="server" Text="Enter Supplier Name: "></asp:Label>
        <asp:TextBox ID="SearchTextBox1" runat="server" Width="281px"></asp:TextBox>
        <asp:Button ID="SearchButton1" runat="server" Text="Search" Width="180px" OnClick="SearchButton1_Click" />
        <asp:Button ID="ClearSearchButton1" runat="server" Text="Clear Search" Width="180px" OnClick="ClearSearchButton1_Click" />
        <asp:SqlDataSource ID="SqlDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [Supplier] WHERE ([SuppName] LIKE '%' + @SuppName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox1" Name="SuppName" PropertyName="Text" Type="String" />
            </SelectParameters>
                        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SuppID" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True"/>
                <asp:BoundField DataField="SuppID" HeaderText="SuppID" InsertVisible="False" ReadOnly="True" SortExpression="SuppID" />
                <asp:BoundField DataField="SuppName" HeaderText="SuppName" SortExpression="SuppName" />
                <asp:BoundField DataField="SuppContactNo" HeaderText="SuppContactNo" SortExpression="SuppContactNo" />
                <asp:BoundField DataField="SuppEmailAddress" HeaderText="SuppEmailAddress" SortExpression="SuppEmailAddress" />
            </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [SuppID] = @original_SuppID AND [SuppName] = @original_SuppName AND [SuppContactNo] = @original_SuppContactNo AND [SuppEmailAddress] = @original_SuppEmailAddress" InsertCommand="INSERT INTO [Supplier] ([SuppName], [SuppContactNo], [SuppEmailAddress]) VALUES (@SuppName, @SuppContactNo, @SuppEmailAddress)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [SuppName] = @SuppName, [SuppContactNo] = @SuppContactNo, [SuppEmailAddress] = @SuppEmailAddress WHERE [SuppID] = @original_SuppID AND [SuppName] = @original_SuppName AND [SuppContactNo] = @original_SuppContactNo AND [SuppEmailAddress] = @original_SuppEmailAddress">
            <DeleteParameters>
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_SuppName" Type="String" />
                <asp:Parameter Name="original_SuppContactNo" Type="String" />
                <asp:Parameter Name="original_SuppEmailAddress" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SuppName" Type="String" />
                <asp:Parameter Name="SuppContactNo" Type="String" />
                <asp:Parameter Name="SuppEmailAddress" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SuppName" Type="String" />
                <asp:Parameter Name="SuppContactNo" Type="String" />
                <asp:Parameter Name="SuppEmailAddress" Type="String" />
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_SuppName" Type="String" />
                <asp:Parameter Name="original_SuppContactNo" Type="String" />
                <asp:Parameter Name="original_SuppEmailAddress" Type="String" />
            </UpdateParameters>
                        </asp:SqlDataSource>
    </div>
                        <br /><br /><br /><br /><br /><br /><br /><br /><br />
                            <br /><br /><br />

    <div class="container">
    <asp:CheckBox ID="CheckBox1Stock" Text="Add Supplier?" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1Stock_CheckedChanged" />
    <asp:Panel ID="AddSuppPanel" runat="server" Visible="false">
    <h3>
        <asp:Label ID="LabelAddProduct" runat="server" Text="Add Supplier"></asp:Label>
    </h3>
    <div class="input-group">
        <asp:Label ID="LabelSupplierName" runat="server" Text="Supplier Name: "></asp:Label>
        <asp:TextBox ID="TextBox1SuppName" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelSuppcontNum" runat="server" Text="Supplier Contact Number:"></asp:Label>
        <asp:TextBox ID="TextBoxSuppContNum" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelEmailAddress" runat="server" Text="Email Address:"></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Button ID="Button1" runat="server" Text="Add Supplier" OnClick="Button1_Click" />
        <asp:SqlDataSource ID="SqlDSAddSupplier" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [SuppID] = @original_SuppID AND [SuppName] = @original_SuppName AND [SuppContactNo] = @original_SuppContactNo AND [SuppEmailAddress] = @original_SuppEmailAddress" InsertCommand="INSERT INTO [Supplier] ([SuppName], [SuppContactNo], [SuppEmailAddress]) VALUES (@SuppName, @SuppContactNo, @SuppEmailAddress)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [SuppName] = @SuppName, [SuppContactNo] = @SuppContactNo, [SuppEmailAddress] = @SuppEmailAddress WHERE [SuppID] = @original_SuppID AND [SuppName] = @original_SuppName AND [SuppContactNo] = @original_SuppContactNo AND [SuppEmailAddress] = @original_SuppEmailAddress">
            <DeleteParameters>
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_SuppName" Type="String" />
                <asp:Parameter Name="original_SuppContactNo" Type="String" />
                <asp:Parameter Name="original_SuppEmailAddress" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1SuppName" Name="SuppName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBoxSuppContNum" Name="SuppContactNo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBoxEmail" Name="SuppEmailAddress" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SuppName" Type="String" />
                <asp:Parameter Name="SuppContactNo" Type="String" />
                <asp:Parameter Name="SuppEmailAddress" Type="String" />
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_SuppName" Type="String" />
                <asp:Parameter Name="original_SuppContactNo" Type="String" />
                <asp:Parameter Name="original_SuppEmailAddress" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>
             </asp:Panel>
        </div>
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
