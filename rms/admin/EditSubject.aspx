<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/basic.Master" CodeBehind="EditSubject.aspx.vb" Inherits="rms.EditSubject" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <h2>Edit Subject</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="SubCode" DataSourceID="SubjectsSqlDataSource" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SubCode" HeaderText="Course Code" ReadOnly="True" 
                SortExpression="SubCode" />
            <asp:BoundField DataField="SubName" HeaderText="Course Name" 
                SortExpression="SubName" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Credit" HeaderText="Max. Credit" 
                SortExpression="Credit" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>

    <asp:SqlDataSource ID="SubjectsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
        DeleteCommand="DELETE FROM [SUBJECT] WHERE [SubCode] = @SubCode" 
        InsertCommand="INSERT INTO [SUBJECT] ([SubCode], [SubName], [Type], [Credit]) VALUES (@SubCode, @SubName, @Type, @Credit)" 
        SelectCommand="SELECT * FROM [SUBJECT] ORDER BY [SubCode]" 
        UpdateCommand="UPDATE [SUBJECT] SET [SubName] = @SubName, [Type] = @Type, [Credit] = @Credit WHERE [SubCode] = @SubCode">
        <DeleteParameters>
            <asp:Parameter Name="SubCode" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SubCode" Type="String" />
            <asp:Parameter Name="SubName" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Credit" Type="Single" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SubName" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Credit" Type="Single" />
            <asp:Parameter Name="SubCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
