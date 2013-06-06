<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/basic.Master" CodeBehind="AddFaculty.aspx.vb" Inherits="rms.AddFaculty" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
<h2>Add Faculty</h2>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="FacultyID" 
        DataSourceID="FacutlySqlDataSource" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
        GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" 
                SortExpression="FacultyName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                SortExpression="Qualification" />
            <asp:BoundField DataField="Interests" HeaderText="Interests" 
                SortExpression="Interests" />
            <asp:BoundField DataField="Projects" HeaderText="Projects" 
                SortExpression="Projects" />
            <asp:BoundField DataField="departmentid" HeaderText="Department Code" 
                SortExpression="departmentid" />
            <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" 
                InsertVisible="False" ReadOnly="True" SortExpression="FacultyID" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="FacutlySqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
        DeleteCommand="DELETE FROM [Faculty] WHERE [FacultyID] = @FacultyID" 
        InsertCommand="INSERT INTO [Faculty] ([FacultyName], [Email], [phone], [Qualification], [Interests], [Projects], [departmentid]) VALUES (@FacultyName, @Email, @phone, @Qualification, @Interests, @Projects, @departmentid)" 
        SelectCommand="SELECT [FacultyName], [Email], [phone], [Qualification], [Interests], [Projects], [departmentid], [FacultyID] FROM [Faculty]" 
        UpdateCommand="UPDATE [Faculty] SET [FacultyName] = @FacultyName, [Email] = @Email, [phone] = @phone, [Qualification] = @Qualification, [Interests] = @Interests, [Projects] = @Projects, [departmentid] = @departmentid WHERE [FacultyID] = @FacultyID">
        <DeleteParameters>
            <asp:Parameter Name="FacultyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FacultyName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Interests" Type="String" />
            <asp:Parameter Name="Projects" Type="String" />
            <asp:Parameter Name="departmentid" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FacultyName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Interests" Type="String" />
            <asp:Parameter Name="Projects" Type="String" />
            <asp:Parameter Name="departmentid" Type="String" />
            <asp:Parameter Name="FacultyID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
