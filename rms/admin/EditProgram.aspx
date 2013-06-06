<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/basic.Master" CodeBehind="EditProgram.aspx.vb" Inherits="rms.EditProgram1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ProgramCode" DataSourceID="ProgramDetailsSqlDataSource" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ProgramCode" HeaderText="Program Code" 
                ReadOnly="True" SortExpression="ProgramCode" />
            <asp:BoundField DataField="ProgramName" HeaderText="Program Name" 
                SortExpression="ProgramName" />
            <asp:BoundField DataField="No_of_semester" HeaderText="No of Semester" 
                SortExpression="No_of_semester" />
            <asp:BoundField DataField="Min_Credits_Required" 
                HeaderText="Min Credits Required" SortExpression="Min_Credits_Required" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="ProgramDetailsSqlDataSource" runat="server" 
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
