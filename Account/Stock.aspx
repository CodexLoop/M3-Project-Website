<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class ="container">
                <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <div "border-style: solid; float: left; width: 60%;">
        <asp:Label ID="Label1" runat="server" Text="Enter Product Name: "></asp:Label>
        <asp:TextBox ID="SearchTextBox1" runat="server" Width="281px"></asp:TextBox>
        <asp:Button ID="SearchButton1" runat="server" Text="Search" Width="180px" OnClick="SearchButton1_Click" />
        <asp:Button ID="ClearSearchButton1" runat="server" Text="Clear Search" Width="180px" OnClick="ClearSearchButton1_Click" />
        <asp:SqlDataSource ID="SqlDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProdName] LIKE '%' + @ProdName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox1" Name="ProdName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <h1>Stock Quantity </h1>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="330px" Width="895px" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" >
                </asp:BoundField>
                <asp:BoundField DataField="ProdDescription" HeaderText="Product Description" SortExpression="ProdDescription" />
                <asp:BoundField DataField="Dosage" HeaderText="Dosage" SortExpression="Dosage" />
                <asp:BoundField DataField="Form" HeaderText="Form" SortExpression="Form" />
                <asp:BoundField DataField="QtyInStock" HeaderText="QtyInStock" SortExpression="QtyInStock" />
                <asp:BoundField DataField="ReorderPoint" HeaderText="Reorder Point" SortExpression="ReorderPoint" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

    </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [ProdID] = @original_ProdID AND [SuppID] = @original_SuppID AND [ProdName] = @original_ProdName AND [ProdDescription] = @original_ProdDescription AND [Dosage] = @original_Dosage AND [Form] = @original_Form AND [ProdPrice] = @original_ProdPrice AND [isPrescriptionMed] = @original_isPrescriptionMed AND [QtyInStock] = @original_QtyInStock AND [ReorderPoint] = @original_ReorderPoint" InsertCommand="INSERT INTO [Product] ([SuppID], [ProdName], [ProdDescription], [Dosage], [Form], [ProdPrice], [isPrescriptionMed], [QtyInStock], [ReorderPoint]) VALUES (@SuppID, @ProdName, @ProdDescription, @Dosage, @Form, @ProdPrice, @isPrescriptionMed, @QtyInStock, @ReorderPoint)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [SuppID] = @SuppID, [ProdName] = @ProdName, [ProdDescription] = @ProdDescription, [Dosage] = @Dosage, [Form] = @Form, [ProdPrice] = @ProdPrice, [isPrescriptionMed] = @isPrescriptionMed, [QtyInStock] = @QtyInStock, [ReorderPoint] = @ReorderPoint WHERE [ProdID] = @original_ProdID AND [SuppID] = @original_SuppID AND [ProdName] = @original_ProdName AND [ProdDescription] = @original_ProdDescription AND [Dosage] = @original_Dosage AND [Form] = @original_Form AND [ProdPrice] = @original_ProdPrice AND [isPrescriptionMed] = @original_isPrescriptionMed AND [QtyInStock] = @original_QtyInStock AND [ReorderPoint] = @original_ReorderPoint">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProdID" Type="Int32" />
                        <asp:Parameter Name="original_SuppID" Type="Int32" />
                        <asp:Parameter Name="original_ProdName" Type="String" />
                        <asp:Parameter Name="original_ProdDescription" Type="String" />
                        <asp:Parameter Name="original_Dosage" Type="String" />
                        <asp:Parameter Name="original_Form" Type="String" />
                        <asp:Parameter Name="original_ProdPrice" Type="Decimal" />
                        <asp:Parameter Name="original_isPrescriptionMed" Type="Boolean" />
                        <asp:Parameter Name="original_QtyInStock" Type="Int32" />
                        <asp:Parameter Name="original_ReorderPoint" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SuppID" Type="Int32" />
                        <asp:Parameter Name="ProdName" Type="String" />
                        <asp:Parameter Name="ProdDescription" Type="String" />
                        <asp:Parameter Name="Dosage" Type="String" />
                        <asp:Parameter Name="Form" Type="String" />
                        <asp:Parameter Name="ProdPrice" Type="Decimal" />
                        <asp:Parameter Name="isPrescriptionMed" Type="Boolean" />
                        <asp:Parameter Name="QtyInStock" Type="Int32" />
                        <asp:Parameter Name="ReorderPoint" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SuppID" Type="Int32" />
                        <asp:Parameter Name="ProdName" Type="String" />
                        <asp:Parameter Name="ProdDescription" Type="String" />
                        <asp:Parameter Name="Dosage" Type="String" />
                        <asp:Parameter Name="Form" Type="String" />
                        <asp:Parameter Name="ProdPrice" Type="Decimal" />
                        <asp:Parameter Name="isPrescriptionMed" Type="Boolean" />
                        <asp:Parameter Name="QtyInStock" Type="Int32" />
                        <asp:Parameter Name="ReorderPoint" Type="Int32" />
                        <asp:Parameter Name="original_ProdID" Type="Int32" />
                        <asp:Parameter Name="original_SuppID" Type="Int32" />
                        <asp:Parameter Name="original_ProdName" Type="String" />
                        <asp:Parameter Name="original_ProdDescription" Type="String" />
                        <asp:Parameter Name="original_Dosage" Type="String" />
                        <asp:Parameter Name="original_Form" Type="String" />
                        <asp:Parameter Name="original_ProdPrice" Type="Decimal" />
                        <asp:Parameter Name="original_isPrescriptionMed" Type="Boolean" />
                        <asp:Parameter Name="original_QtyInStock" Type="Int32" />
                        <asp:Parameter Name="original_ReorderPoint" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <br /><br /><br />


    </div>
<div class="container">



            <asp:CheckBox ID="CheckBox1Stock" Text="Add more stock?" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1Stock_CheckedChanged" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" Text ="Click to view/add a new Supplier" runat="server" OnClick="LinkButton1_Click">Click to view/add a new Supplier</asp:LinkButton>
                <asp:Panel ID="AddStockPanel" runat="server" Visible="false">
    <h3>
        <asp:Label ID="LabelAddProduct" runat="server" Text="Add products"></asp:Label>
    </h3>
    <div class="input-group">
        <asp:Label ID="LabelSupplierId" runat="server" Text="Supplier ID: "></asp:Label>
        <asp:TextBox ID="TextBox1SuppID" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelProdName" runat="server" Text="Product Name:"></asp:Label>
        <asp:TextBox ID="TextBox2ProdName" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelProdDesc" runat="server" Text="Product Description:"></asp:Label>
        <asp:TextBox ID="TextBox3ProdDesc" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelDosage" runat="server" Text="Dosage:"></asp:Label> 

        <asp:TextBox ID="TextBox4Dosage" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
<asp:Label ID="LabelForm" runat="server" Text="Form:"></asp:Label>
<asp:TextBox ID="TextBoxForm" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>
        
            
    <div class="input-group">
    <asp:Label ID="LabelPrice" runat="server" Text="Price:"></asp:Label>
    <asp:TextBox ID="TextBoxPrice" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
     </div>

    <div class="input-group">
        <asp:CheckBox ID="CheckBoxPrescriptMed" Text="Is Prescription Med?" runat="server" />
    </div>

    <div class="input-group">
        <asp:Label ID="LabelQty" runat="server" Text="Quantity in Stock:"></asp:Label>
        <asp:TextBox ID="TextBox5Qty" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

        <div class="input-group">
        <asp:Label ID="LabelReorderPoint" runat="server" Text="Reorder Point:"></asp:Label>
        <asp:TextBox ID="TextBox1ReorderPoint" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Button ID="Button1" runat="server" Text="Add more Stock" OnClick="Button1_Click" />
            </div>
             </asp:Panel>
                        <br /><br /><br />            <br /><br /><br />            <br /><br /><br />

        </div>
    <%--<div class="container">--%>

        
        <!-- Panel to Add Stock, initially hidden -->
        <%--<asp:Panel ID="AddStockPanel" runat="server" Visible="false">
    <h3>
        <asp:Label ID="LabelAddProduct" runat="server" Text="Add products"></asp:Label>
    </h3>
    <div class="input-group">
        <asp:Label ID="LabelSupplierId" runat="server" Text="Supplier ID: "></asp:Label>
        <asp:TextBox ID="TextBox1SuppID" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelProdName" runat="server" Text="Product Name:"></asp:Label>
        <asp:TextBox ID="TextBox2ProdName" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelProdDesc" runat="server" Text="Product Description:"></asp:Label>
        <asp:TextBox ID="TextBox3ProdDesc" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Label ID="LabelDosage" runat="server" Text="Dosage:"></asp:Label> 

        <asp:TextBox ID="TextBox4Dosage" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
<asp:Label ID="LabelForm" runat="server" Text="Form:"></asp:Label>
<asp:TextBox ID="TextBoxForm" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>
        
            
    <div class="input-group">
    <asp:Label ID="LabelPrice" runat="server" Text="Price:"></asp:Label>
    <asp:TextBox ID="TextBoxPrice" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
     </div>

    <div class="input-group">
        <asp:CheckBox ID="CheckBoxPrescriptMed" Text="Is Prescription Med?" runat="server" />
    </div>

    <div class="input-group">
        <asp:Label ID="LabelQty" runat="server" Text="Quantity in Stock:"></asp:Label>
        <asp:TextBox ID="TextBox5Qty" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

        <div class="input-group">
        <asp:Label ID="LabelReorderPoint" runat="server" Text="Reorder Point:"></asp:Label>
        <asp:TextBox ID="TextBox1ReorderPoint" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
    </div>

    <div class="input-group">
        <asp:Button ID="Button1" runat="server" Text="Add more Stock" OnClick="Button1_Click" />
            </div>
             </asp:Panel>--%>

        <asp:SqlDataSource ID="SqlDSAddProducts" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [ProdID] = @original_ProdID AND [SuppID] = @original_SuppID AND [ProdName] = @original_ProdName AND [ProdDescription] = @original_ProdDescription AND [Dosage] = @original_Dosage AND [Form] = @original_Form AND [ProdPrice] = @original_ProdPrice AND [isPrescriptionMed] = @original_isPrescriptionMed AND [QtyInStock] = @original_QtyInStock AND [ReorderPoint] = @original_ReorderPoint" InsertCommand="INSERT INTO [Product] ([SuppID], [ProdName], [ProdDescription], [Dosage], [Form], [ProdPrice], [isPrescriptionMed], [QtyInStock], [ReorderPoint]) VALUES (@SuppID, @ProdName, @ProdDescription, @Dosage, @Form, @ProdPrice, @isPrescriptionMed, @QtyInStock, @ReorderPoint)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [SuppID] = @SuppID, [ProdName] = @ProdName, [ProdDescription] = @ProdDescription, [Dosage] = @Dosage, [Form] = @Form, [ProdPrice] = @ProdPrice, [isPrescriptionMed] = @isPrescriptionMed, [QtyInStock] = @QtyInStock, [ReorderPoint] = @ReorderPoint WHERE [ProdID] = @original_ProdID AND [SuppID] = @original_SuppID AND [ProdName] = @original_ProdName AND [ProdDescription] = @original_ProdDescription AND [Dosage] = @original_Dosage AND [Form] = @original_Form AND [ProdPrice] = @original_ProdPrice AND [isPrescriptionMed] = @original_isPrescriptionMed AND [QtyInStock] = @original_QtyInStock AND [ReorderPoint] = @original_ReorderPoint">

            <DeleteParameters>
                <asp:Parameter Name="original_ProdID" Type="Int32" />
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_ProdName" Type="String" />
                <asp:Parameter Name="original_ProdDescription" Type="String" />
                <asp:Parameter Name="original_Dosage" Type="String" />
                <asp:Parameter Name="original_Form" Type="String" />
                <asp:Parameter Name="original_ProdPrice" Type="Decimal" />
                <asp:Parameter Name="original_isPrescriptionMed" Type="Boolean" />
                <asp:Parameter Name="original_QtyInStock" Type="Int32" />
                <asp:Parameter Name="original_ReorderPoint" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1SuppID" Name="SuppID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2ProdName" Name="ProdName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox3ProdDesc" Name="ProdDescription" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox4Dosage" Name="Dosage" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBoxForm" Name="Form" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBoxPrice" Name="ProdPrice" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="CheckBoxPrescriptMed" Name="isPrescriptionMed" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="TextBox5Qty" Name="QtyInStock" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1ReorderPoint" Name="ReorderPoint" PropertyName="Text" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SuppID" Type="Int32" />
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdDescription" Type="String" />
                <asp:Parameter Name="Dosage" Type="String" />
                <asp:Parameter Name="Form" Type="String" />
                <asp:Parameter Name="ProdPrice" Type="Decimal" />
                <asp:Parameter Name="isPrescriptionMed" Type="Boolean" />
                <asp:Parameter Name="QtyInStock" Type="Int32" />
                <asp:Parameter Name="ReorderPoint" Type="Int32" />
                <asp:Parameter Name="original_ProdID" Type="Int32" />
                <asp:Parameter Name="original_SuppID" Type="Int32" />
                <asp:Parameter Name="original_ProdName" Type="String" />
                <asp:Parameter Name="original_ProdDescription" Type="String" />
                <asp:Parameter Name="original_Dosage" Type="String" />
                <asp:Parameter Name="original_Form" Type="String" />
                <asp:Parameter Name="original_ProdPrice" Type="Decimal" />
                <asp:Parameter Name="original_isPrescriptionMed" Type="Boolean" />
                <asp:Parameter Name="original_QtyInStock" Type="Int32" />
                <asp:Parameter Name="original_ReorderPoint" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource> 

                <br /><br /><br />            <br /><br /><br />            <br /><br /><br />
                <br /><br /><br />            <br /><br /><br />            <br /><br /><br />
</asp:Content>

