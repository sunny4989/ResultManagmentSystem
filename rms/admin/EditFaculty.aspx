<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="EditFaculty.aspx.vb" Inherits="rms.EditFaculty" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <h2>Edit Faculty Details</h2>
    <asp:GridView ID="FacultyEditGridView" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="FacultyID" 
        DataSourceID="FacultySqlDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" 
                SortExpression="FacultyName" />
            <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" 
                InsertVisible="False" ReadOnly="True" SortExpression="FacultyID" />
            <asp:BoundField DataField="departmentid" HeaderText="departmentid" 
                SortExpression="departmentid" />
            <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
        <asp:SqlDataSource ID="FacultySqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
        DeleteCommand="DELETE FROM [Faculty] WHERE [FacultyID] = @FacultyID" 
        InsertCommand="INSERT INTO [Faculty] ([FacultyName], [departmentid], [phone], [Email]) VALUES (@FacultyName, @departmentid, @phone, @Email)" 
        SelectCommand="SELECT [FacultyName], [FacultyID], [departmentid], [phone], [Email] FROM [Faculty]" 
        UpdateCommand="UPDATE [Faculty] SET [FacultyName] = @FacultyName, [departmentid] = @departmentid, [phone] = @phone, [Email] = @Email WHERE [FacultyID] = @FacultyID">
            <DeleteParameters>
                <asp:Parameter Name="FacultyID" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FacultyName" Type="String" />
                <asp:Parameter Name="departmentid" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FacultyName" Type="String" />
                <asp:Parameter Name="departmentid" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="FacultyID" Type="Int64" />
            </UpdateParameters>
    </asp:SqlDataSource>
        <hr />
</asp:Content>
