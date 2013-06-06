<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="AddSubject.aspx.vb" Inherits="rms.AddSubject" %>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
<h2>Add Subject
    </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" 
        AutoGenerateRows="False" DataKeyNames="SubCode" 
        DataSourceID="SubjectsSqlDataSource" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
        GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="SubCode" HeaderText="Course Code" ReadOnly="True" 
                SortExpression="SubCode" />
            <asp:BoundField DataField="SubName" HeaderText="Course Title" 
                SortExpression="SubName" />
            <asp:BoundField DataField="Type" HeaderText="Type (P/T)" 
                SortExpression="Type" />
            <asp:BoundField DataField="Credit" HeaderText="Max. Credit" 
                SortExpression="Credit" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
    </asp:DetailsView>
   
            
    <asp:SqlDataSource ID="SubjectsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
        DeleteCommand="DELETE FROM [SUBJECT] WHERE [SubCode] = @SubCode" 
        InsertCommand="INSERT INTO [SUBJECT] ([SubCode], [SubName], [Type], [Credit]) VALUES (@SubCode, @SubName, @Type, @Credit)" 
        SelectCommand="SELECT * FROM [SUBJECT]" 
        UpdateCommand="UPDATE [SUBJECT] SET [SubName] = @SubName, [Type] = @Type, [Credit] = @Credit WHERE [SubCode] = @SubCode">
        <DeleteParameters>
            <asp:Parameter Name="SubCode" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SubCode" Type="String" />
            <asp:Parameter Name="SubName" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Credit" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SubName" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Credit" Type="Decimal" />
            <asp:Parameter Name="SubCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
            
</asp:Content>


