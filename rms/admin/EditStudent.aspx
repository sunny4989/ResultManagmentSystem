<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="EditStudent.aspx.vb" Inherits="rms.EditStudent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" >
        <table style="width: 100%; height: 28px;">
            <tr>
                <td style="width: 144px">
                    Entry Number :</td>
                <td style="width: 298px">
                    <asp:TextBox ID="EditEntryNoTextBox" runat="server" MaxLength="13" Width="197px" 
                                        CssClass="DropBox" ValidationGroup="EditStudent"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="EntryNumberRequiredFieldValidator0" 
                                        runat="server" ControlToValidate="EditEntryNoTextBox" Display="Dynamic" 
                                        ErrorMessage="Data Required" ForeColor="Red" 
                SetFocusOnError="True" ValidationGroup="EditStudent"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 144px">
                    &nbsp;</td>
                <td style="width: 298px">
                    <asp:Button ID="EditEnrtyNumberButton" runat="server" Text="Button" 
                        ValidationGroup="EditStudent" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <hr />
    </asp:Panel>
    <asp:Panel ID="panel2" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" 
    AutoGenerateRows="False" DataKeyNames="EntryNo" 
    DataSourceID="StudentsSqlDataSource" Height="50px" Width="125px" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
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
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="StudentsSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
    DeleteCommand="DELETE FROM [STUDENT] WHERE [EntryNo] = @EntryNo" 
    InsertCommand="INSERT INTO [STUDENT] ([EntryNo], [Name], [ProgramCode], [FatherName], [Sex], [DOB], [Email_Id], [MobileNumber], [ParentAddress], [TemproraryAddress]) VALUES (@EntryNo, @Name, @ProgramCode, @FatherName, @Sex, @DOB, @Email_Id, @MobileNumber, @ParentAddress, @TemproraryAddress)" 
    SelectCommand="SELECT * FROM [STUDENT] WHERE ([EntryNo] = @EntryNo)" 
    
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
            <SelectParameters>
                <asp:ControlParameter ControlID="EditEntryNoTextBox" Name="EntryNo" 
            PropertyName="Text" Type="String" />
            </SelectParameters>
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
    
   </asp:Panel>
</asp:Content>
