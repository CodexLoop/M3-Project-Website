<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaptureNewCust.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.CaptureNewCust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                 <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
                 <%--        <div class="input-group">
            <asp:Label runat="server" Text="Customer Email Address:"></asp:Label>
            <asp:TextBox ID="TextBox5CustEmailAdd" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>
    </div>--%>
<%--    <style>
    .container {
        width: 80%; /* Adjust width as needed */
        margin: 30px auto; /* Center the container and add top/bottom margin */
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box; /* Include padding and border in width/height */
    }
    .input-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 15px;
        box-sizing: border-box; /* Include padding and border in width/height */
    }
    .container label {
        font-weight: bold;
        margin-bottom: 5px;
    }
    /* Ensure all text boxes fit within the container */
    .container input[type="text"],
    .container .asp:TextBox {
        width: 100%;
        box-sizing: border-box; /* Include padding and border in width */
    }
</style>--%>

    <div class="container">
        <h3>Customer Details</h3>
        <div class="input-group">
            <asp:Label ID="MessageError" runat="server" Text="Label"></asp:Label>

            <asp:Label runat="server" Text="Customer ID: "></asp:Label>
            <asp:TextBox ID="TextBox1CustID" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Customer First Name:"></asp:Label>
            <asp:TextBox ID="TextBox2CustFN" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Customer Last Name:"></asp:Label>
            <asp:TextBox ID="TextBox3CustLN" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Date Of Birth [Year]-[month]-[day]:"></asp:Label> 

            <asp:TextBox ID="TextBox4DOB" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
    <asp:Label runat="server" Text="Customer Cell Number:"></asp:Label>
    <asp:TextBox ID="TextBoxCustNumber" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>
            
                
        <div class="input-group">
        <asp:Label runat="server" Text="Customer Address:"></asp:Label>
        <asp:TextBox ID="TextBoxAdress" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
         </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Customer Email Address:"></asp:Label>
            <asp:TextBox ID="TextBox5CustEmailAdd" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>
    </div>
                <br /><br /><br />     
    <div class="container">
        <h3>Medical Aid Details</h3>
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Has Medical Aid?" />

        <div class="input-group">
            <asp:Label runat="server" Text="Medical Aid Name:"></asp:Label>
            <asp:TextBox ID="TextBox6MedicalAN" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Main Member Number:"></asp:Label>
            <asp:TextBox ID="TextBox7MMNumber" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Policy Number:"></asp:Label>
            <asp:TextBox ID="TextBox8PolicyNO" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div class="input-group">
            <asp:Label runat="server" Text="Plan type:"></asp:Label>
            <asp:TextBox ID="TextBox9PlanType" runat="server" BorderStyle="Solid" Width="100%" Height="30px"></asp:TextBox>
        </div>

        <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="Button1" runat="server" Text="Submit Details" OnClientClick="return ConfirmMessage();" OnClick="Button1_Click" CssClass="btn btn-primary" />
        </div>
    </div>

                 <asp:SqlDataSource ID="SqlDSCustomer" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustID] = @original_CustID AND [CustFirstNames] = @original_CustFirstNames AND [CustLastName] = @original_CustLastName AND [DOB] = @original_DOB AND [ContactNo] = @original_ContactNo AND [Address] = @original_Address AND (([CustEmailAddress] = @original_CustEmailAddress) OR ([CustEmailAddress] IS NULL AND @original_CustEmailAddress IS NULL)) AND (([hasMedicalAid] = @original_hasMedicalAid) OR ([hasMedicalAid] IS NULL AND @original_hasMedicalAid IS NULL)) AND (([MedAidName] = @original_MedAidName) OR ([MedAidName] IS NULL AND @original_MedAidName IS NULL)) AND (([MainMemberID] = @original_MainMemberID) OR ([MainMemberID] IS NULL AND @original_MainMemberID IS NULL)) AND (([PolicyNo] = @original_PolicyNo) OR ([PolicyNo] IS NULL AND @original_PolicyNo IS NULL)) AND (([PlanType] = @original_PlanType) OR ([PlanType] IS NULL AND @original_PlanType IS NULL))" InsertCommand="INSERT INTO [Customer] ([CustID], [CustFirstNames], [CustLastName], [DOB], [ContactNo], [Address], [CustEmailAddress], [hasMedicalAid], [MedAidName], [MainMemberID], [PolicyNo], [PlanType]) VALUES (@CustID, @CustFirstNames, @CustLastName, @DOB, @ContactNo, @Address, @CustEmailAddress, @hasMedicalAid, @MedAidName, @MainMemberID, @PolicyNo, @PlanType)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [CustFirstNames] = @CustFirstNames, [CustLastName] = @CustLastName, [DOB] = @DOB, [ContactNo] = @ContactNo, [Address] = @Address, [CustEmailAddress] = @CustEmailAddress, [hasMedicalAid] = @hasMedicalAid, [MedAidName] = @MedAidName, [MainMemberID] = @MainMemberID, [PolicyNo] = @PolicyNo, [PlanType] = @PlanType WHERE [CustID] = @original_CustID AND [CustFirstNames] = @original_CustFirstNames AND [CustLastName] = @original_CustLastName AND [DOB] = @original_DOB AND [ContactNo] = @original_ContactNo AND [Address] = @original_Address AND (([CustEmailAddress] = @original_CustEmailAddress) OR ([CustEmailAddress] IS NULL AND @original_CustEmailAddress IS NULL)) AND (([hasMedicalAid] = @original_hasMedicalAid) OR ([hasMedicalAid] IS NULL AND @original_hasMedicalAid IS NULL)) AND (([MedAidName] = @original_MedAidName) OR ([MedAidName] IS NULL AND @original_MedAidName IS NULL)) AND (([MainMemberID] = @original_MainMemberID) OR ([MainMemberID] IS NULL AND @original_MainMemberID IS NULL)) AND (([PolicyNo] = @original_PolicyNo) OR ([PolicyNo] IS NULL AND @original_PolicyNo IS NULL)) AND (([PlanType] = @original_PlanType) OR ([PlanType] IS NULL AND @original_PlanType IS NULL))">
                     <DeleteParameters>
                         <asp:Parameter Name="original_CustID" Type="String" />
                         <asp:Parameter Name="original_CustFirstNames" Type="String" />
                         <asp:Parameter Name="original_CustLastName" Type="String" />
                         <asp:Parameter DbType="Date" Name="original_DOB" />
                         <asp:Parameter Name="original_ContactNo" Type="String" />
                         <asp:Parameter Name="original_Address" Type="String" />
                         <asp:Parameter Name="original_CustEmailAddress" Type="String" />
                         <asp:Parameter Name="original_hasMedicalAid" Type="Boolean" />
                         <asp:Parameter Name="original_MedAidName" Type="String" />
                         <asp:Parameter Name="original_MainMemberID" Type="String" />
                         <asp:Parameter Name="original_PolicyNo" Type="String" />
                         <asp:Parameter Name="original_PlanType" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:ControlParameter ControlID="TextBox1CustID" Name="CustID" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox2CustFN" Name="CustFirstNames" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox3CustLN" Name="CustLastName" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox4DOB" DbType="Date" Name="DOB" PropertyName="Text" />
                         <asp:ControlParameter ControlID="TextBoxCustNumber" Name="ContactNo" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBoxAdress" Name="Address" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox5CustEmailAdd" Name="CustEmailAddress" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="CheckBox1" Name="hasMedicalAid" PropertyName="Checked" Type="Boolean" />
                         <asp:ControlParameter ControlID="TextBox6MedicalAN" Name="MedAidName" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox7MMNumber" Name="MainMemberID" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox8PolicyNO" Name="PolicyNo" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBox9PlanType" Name="PlanType" PropertyName="Text" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="CustFirstNames" Type="String" />
                         <asp:Parameter Name="CustLastName" Type="String" />
                         <asp:Parameter DbType="Date" Name="DOB" />
                         <asp:Parameter Name="ContactNo" Type="String" />
                         <asp:Parameter Name="Address" Type="String" />
                         <asp:Parameter Name="CustEmailAddress" Type="String" />
                         <asp:Parameter Name="hasMedicalAid" Type="Boolean" />
                         <asp:Parameter Name="MedAidName" Type="String" />
                         <asp:Parameter Name="MainMemberID" Type="String" />
                         <asp:Parameter Name="PolicyNo" Type="String" />
                         <asp:Parameter Name="PlanType" Type="String" />
                         <asp:Parameter Name="original_CustID" Type="String" />
                         <asp:Parameter Name="original_CustFirstNames" Type="String" />
                         <asp:Parameter Name="original_CustLastName" Type="String" />
                         <asp:Parameter DbType="Date" Name="original_DOB" />
                         <asp:Parameter Name="original_ContactNo" Type="String" />
                         <asp:Parameter Name="original_Address" Type="String" />
                         <asp:Parameter Name="original_CustEmailAddress" Type="String" />
                         <asp:Parameter Name="original_hasMedicalAid" Type="Boolean" />
                         <asp:Parameter Name="original_MedAidName" Type="String" />
                         <asp:Parameter Name="original_MainMemberID" Type="String" />
                         <asp:Parameter Name="original_PolicyNo" Type="String" />
                         <asp:Parameter Name="original_PlanType" Type="String" />
                     </UpdateParameters>
                 </asp:SqlDataSource>

                 <br /><br /><br />     <br /><br /><br />     <br /><br /><br />

    <script>
        function ConfirmMessage() {
            return confirm("Confirm submit details?");
        }
    </script>
</asp:Content>
