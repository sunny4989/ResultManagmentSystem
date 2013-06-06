<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="Students.aspx.vb" Inherits="rms.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_right" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="EntryNo" DataSourceID="SqlDataSource1" Height="50px" 
    Width="125px">
    <Fields>
        <asp:BoundField DataField="EntryNo" HeaderText="EntryNo" ReadOnly="True" 
            SortExpression="EntryNo" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="ProgramCode" HeaderText="ProgramCode" 
            SortExpression="ProgramCode" />
        <asp:BoundField DataField="FatherName" HeaderText="FatherName" 
            SortExpression="FatherName" />
        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
        <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
        <asp:BoundField DataField="Email_Id" HeaderText="Email_Id" 
            SortExpression="Email_Id" />
        <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" 
            SortExpression="MobileNumber" />
        <asp:BoundField DataField="ParentAddress" HeaderText="ParentAddress" 
            SortExpression="ParentAddress" />
        <asp:BoundField DataField="TemproraryAddress" HeaderText="TemproraryAddress" 
            SortExpression="TemproraryAddress" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
    DeleteCommand="DELETE FROM [STUDENT] WHERE [EntryNo] = @EntryNo" 
    InsertCommand="INSERT INTO [STUDENT] ([EntryNo], [Name], [ProgramCode], [FatherName], [Sex], [DOB], [Email_Id], [MobileNumber], [ParentAddress], [TemproraryAddress]) VALUES (@EntryNo, @Name, @ProgramCode, @FatherName, @Sex, @DOB, @Email_Id, @MobileNumber, @ParentAddress, @TemproraryAddress)" 
    SelectCommand="SELECT * FROM [STUDENT]" 
    UpdateCommand="UPDATE [STUDENT] SET [Name] = @Name, [ProgramCode] = @ProgramCode, [FatherName] = @FatherName, [Sex] = @Sex, [DOB] = @DOB, [Email_Id] = @Email_Id, [MobileNumber] = @MobileNumber, [ParentAddress] = @ParentAddress, [TemproraryAddress] = @TemproraryAddress WHERE [EntryNo] = @EntryNo">
    <DeleteParameters>
        <asp:Parameter Name="EntryNo" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="EntryNo" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="ProgramCode" Type="String" />
        <asp:Parameter Name="FatherName" Type="String" />
        <asp:Parameter Name="Sex" Type="String" />
        <asp:Parameter DbType="Date" Name="DOB" />
        <asp:Parameter Name="Email_Id" Type="String" />
        <asp:Parameter Name="MobileNumber" Type="String" />
        <asp:Parameter Name="ParentAddress" Type="String" />
        <asp:Parameter Name="TemproraryAddress" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="ProgramCode" Type="String" />
        <asp:Parameter Name="FatherName" Type="String" />
        <asp:Parameter Name="Sex" Type="String" />
        <asp:Parameter DbType="Date" Name="DOB" />
        <asp:Parameter Name="Email_Id" Type="String" />
        <asp:Parameter Name="MobileNumber" Type="String" />
        <asp:Parameter Name="ParentAddress" Type="String" />
        <asp:Parameter Name="TemproraryAddress" Type="String" />
        <asp:Parameter Name="EntryNo" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
