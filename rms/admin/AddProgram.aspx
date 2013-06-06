<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/basic.Master" CodeBehind="AddProgram.aspx.vb" Inherits="rms.AddProgram" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
<h2> Add a new Program in the university</h2>
    <asp:DetailsView ID="ProgramDetailsView" runat="server" 
    AutoGenerateRows="False" DataKeyNames="ProgramCode" 
    DataSourceID="ProgramSqlDataSource" Height="50px" Width="125px" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <Fields>
        <asp:BoundField DataField="ProgramCode" HeaderText="ProgramCode" 
            ReadOnly="True" SortExpression="ProgramCode" />
        <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" 
            SortExpression="ProgramName" />
        <asp:BoundField DataField="No_of_semester" HeaderText="No_of_semester" 
            SortExpression="No_of_semester" />
        <asp:BoundField DataField="Min_Credits_Required" 
            HeaderText="Min_Credits_Required" SortExpression="Min_Credits_Required" />
        <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
    </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
</asp:DetailsView>
<asp:SqlDataSource ID="ProgramSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
    DeleteCommand="DELETE FROM [PROGRAMMES] WHERE [ProgramCode] = @ProgramCode" 
    InsertCommand="INSERT INTO [PROGRAMMES] ([ProgramCode], [ProgramName], [No_of_semester], [Min_Credits_Required]) VALUES (@ProgramCode, @ProgramName, @No_of_semester, @Min_Credits_Required)" 
    SelectCommand="SELECT * FROM [PROGRAMMES]" 
    UpdateCommand="UPDATE [PROGRAMMES] SET [ProgramName] = @ProgramName, [No_of_semester] = @No_of_semester, [Min_Credits_Required] = @Min_Credits_Required WHERE [ProgramCode] = @ProgramCode">
    <DeleteParameters>
        <asp:Parameter Name="ProgramCode" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProgramCode" Type="String" />
        <asp:Parameter Name="ProgramName" Type="String" />
        <asp:Parameter Name="No_of_semester" Type="Int32" />
        <asp:Parameter Name="Min_Credits_Required" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProgramName" Type="String" />
        <asp:Parameter Name="No_of_semester" Type="Int32" />
        <asp:Parameter Name="Min_Credits_Required" Type="Int32" />
        <asp:Parameter Name="ProgramCode" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
