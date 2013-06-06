<%@ Page Title="" Language="vb" AutoEventWireup="true"  MasterPageFile="~/basic.Master" CodeBehind="ResultManager.aspx.vb" Inherits="rms.ResultManager" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <table style="width:100%;">
        <tr>
            <td colspan="4" style="text-decoration: underline; color: #990033">
                <b>Add Result Information about Student </b>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 118px">
                Program :</td>
            <td colspan="3">
                <asp:DropDownList ID="ProgramDropDownList" runat="server" 
                    ValidationGroup="AddResult" AutoPostBack="True" 
                    DataSourceID="AvailDepartmentsSqlDataSource" DataTextField="ProgramName" 
                    DataValueField="ProgramCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AvailDepartmentsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [ProgramCode], [ProgramName] FROM [PROGRAMMES]">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ProgramRequiredFieldValidator" runat="server" 
                    ControlToValidate="ProgramDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Semester :</td>
            <td colspan="3">
                <asp:DropDownList ID="SemesterDropDownList" runat="server" 
                    CssClass="DropBox" ValidationGroup="AddResult" AutoPostBack="True">
                    <asp:ListItem Value="1">I</asp:ListItem>
                    <asp:ListItem Value="2">II</asp:ListItem>
                    <asp:ListItem Value="3">III</asp:ListItem>
                    <asp:ListItem Value="4">IV</asp:ListItem>
                    <asp:ListItem Value="5">V</asp:ListItem>
                    <asp:ListItem Value="6">VI</asp:ListItem>
                    <asp:ListItem Value="7">VII</asp:ListItem>
                    <asp:ListItem Value="8">VIII</asp:ListItem>
                    <asp:ListItem Value="9">IX</asp:ListItem>
                    <asp:ListItem Value="10">X</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="SemesterRequiredFieldValidator" runat="server" 
                    ControlToValidate="SemesterDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Subject :</td>
            <td colspan="3">
                <asp:DropDownList ID="SubjectDropDownList" runat="server" 
                   ValidationGroup="AddResult" AutoPostBack="True" 
                    DataSourceID="AllSubjectTaughtByFacultySqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AllSubjectTaughtByFacultySqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT SUBJECT.SubCode, SUBJECT.SubName FROM SUBJECT INNER JOIN TEACH_BY ON SUBJECT.SubCode = TEACH_BY.SubjectCode WHERE (TEACH_BY.FacultyId = @LoggedInfacultyId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="LoggedInfacultyId" 
                            SessionField="LoggedFacultyID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="SubjectRequiredFieldValidator" runat="server" 
                    ControlToValidate="SubjectDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Entry Number :</td>
            <td colspan="3">
                <asp:DropDownList ID="EntryNumberDropDownList" runat="server" 
                     ValidationGroup="AddResult" AutoPostBack="True" 
                    DataSourceID="StudentInCurrentDepartmentSqlDataSource" DataTextField="EntryNo" 
                    DataValueField="EntryNo">
                </asp:DropDownList>
                <asp:SqlDataSource ID="StudentInCurrentDepartmentSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [EntryNo], [ProgramCode] FROM [STUDENT] WHERE ([ProgramCode] = @ProgramCode)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ProgramDropDownList" Name="ProgramCode" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="EntryNumberRequiredFieldValidator" 
                    runat="server" ControlToValidate="EntryNumberDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Status :</td>
            <td colspan="3">
                <asp:DropDownList ID="StatusDropDownList" runat="server" CssClass="DropBox" 
                    ValidationGroup="AddResult" Height="17px">
                    <asp:ListItem Value="F">Finalized</asp:ListItem>
                    <asp:ListItem Value="W">Awaiting</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="StatusRequiredFieldValidator" runat="server" 
                    ControlToValidate="StatusDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Minor 1 Mark:</td>
            <td style="width: 25px" align="right">
                <asp:TextBox ID="Minor1MarkTextBox" runat="server" ValidationGroup="AddResult" 
                    Width="62px"></asp:TextBox>
            </td>
            <td style="width: 1px">
                /</td>
            <td style="width: 61px">
                <asp:TextBox ID="Minor1MarkOutOfTextBox" runat="server" 
                    ValidationGroup="AddResult" Width="62px">20</asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="Minor1MarkCustomValidator" runat="server" 
                    ControlToValidate="Minor1MarkTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="AddResult" ValidateEmptyText="True" 
                    ErrorMessage="Required Marks OR Out Of Bound"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Minor 2 Mark:</td>
            <td style="width: 25px" dir="ltr" align="right">
                <asp:TextBox ID="Minor2MarkTextBox" runat="server" ValidationGroup="AddResult" 
                    Width="62px"></asp:TextBox>
            </td>
            <td style="width: 1px">
                /</td>
            <td style="width: 61px">
                <asp:TextBox ID="Minor2MarkOutOfTextBox" runat="server" 
                    ValidationGroup="AddResult" Width="62px">20</asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="Minor2MarkCustomValidator" runat="server" 
                    ControlToValidate="Minor2MarkTextBox" Display="Dynamic" 
                    ErrorMessage="Required Marks OR Out Of Bound" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="AddResult" ValidateEmptyText="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Assignment Mark :</td>
            <td style="width: 25px" dir="ltr" align="right">
                <asp:TextBox ID="AssignmentMarkTextBox" runat="server" 
                    ValidationGroup="AddResult" Width="62px"></asp:TextBox>
            </td>
            <td style="width: 1px">
                /</td>
            <td style="width: 61px">
                <asp:TextBox ID="AssignmentMarkOutOfTextBox" runat="server" 
                    ValidationGroup="AddResult" Width="62px">10</asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="AssigmentMarkCustomValidator" runat="server" 
                    ControlToValidate="AssignmentMarkTextBox" Display="Dynamic" 
                    ErrorMessage="Required Marks OR Out Of Bound" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="AddResult" ValidateEmptyText="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Major Mark:</td>
            <td style="width: 25px" dir="ltr" align="right">
                <asp:TextBox ID="MajorMarkTextBox" runat="server" ValidationGroup="AddResult" 
                    Width="62px"></asp:TextBox>
            </td>
            <td style="width: 1px">
                /</td>
            <td style="width: 61px">
                <asp:TextBox ID="MajorMarkOutOfTextBox" runat="server" 
                    ValidationGroup="AddResult" Width="62px">50</asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="MajorMarkCustomValidator" runat="server" 
                    ControlToValidate="MajorMarkTextBox" Display="Dynamic" 
                    ErrorMessage="Required Marks OR Out Of Bound" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="AddResult" ValidateEmptyText="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Grade Granted :</td>
            <td colspan="2" align="right" dir="ltr" >
                <asp:DropDownList ID="GradeEarnedDropdownList" runat="server" 
                    DataSourceID="GradeSystemSqlDataSource1" DataTextField="Grade" 
                    DataValueField="Grade">
                </asp:DropDownList>
            
                </td>
        </tr>
        <tr>
            <td style="width: 118px">
                Comment :</td>
            <td colspan="3">
                <asp:TextBox ID="CommentTextBox" runat="server" Height="76px" 
                    TextMode="MultiLine" Width="210px" ValidationGroup="AddResult"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 118px">
                &nbsp;</td>
            <td colspan="3">
                <asp:Button ID="AddResultButton" runat="server" CssClass="DropBox" Text="Add Result" 
                    ValidationGroup="AddResult" />
            </td>
            <td>
                <asp:Button ID="UpdateResultButton" runat="server" CssClass="DropBox" 
                    Text="Update Result" ValidationGroup="AddResult" Width="192px" />
            </td>
        </tr>
        <tr>
            <td>

                <asp:SqlDataSource ID="GradeSystemSqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [Grade] FROM [Grading]"></asp:SqlDataSource>

            </td>
        </tr>
    </table>

    <asp:GridView ID="ResultsGridView" runat="server" AllowPaging="True" 
         AllowSorting="True" AutoGenerateColumns="False" 
         DataKeyNames="SubjectCode,StudiedInSemester,EntryNumber" 
         DataSourceID="ResultsSqlDataSource1" CellPadding="4" ForeColor="#333333" 
         GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="StudiedInSemester" HeaderText="Sem" ReadOnly="True" 
                SortExpression="StudiedInSemester" />
            <asp:BoundField DataField="EntryNumber" HeaderText="Entry No" ReadOnly="True" 
                SortExpression="EntryNumber" />
            <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" 
                ReadOnly="True" SortExpression="SubjectCode" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="Minor1Marks" HeaderText="Minor1" 
                SortExpression="Minor1Marks" />
            <asp:BoundField DataField="OutOfMinor1Marks" HeaderText="Max. Minor1" 
                SortExpression="OutOfMinor1Marks" />
            <asp:BoundField DataField="Minor2Marks" HeaderText="Minor 2" 
                SortExpression="Minor2Marks" />
            <asp:BoundField DataField="OutOfMinor2Marks" HeaderText="Max. Minor2" 
                SortExpression="OutOfMinor2Marks" />
            <asp:BoundField DataField="AssignmentMarks" HeaderText="Assign Marks" 
                SortExpression="AssignmentMarks" />
            <asp:BoundField DataField="OutOfAssingmentMarks" 
                HeaderText="Max. Assingn Marks" SortExpression="OutOfAssingmentMarks" />
            <asp:BoundField DataField="MajorMarks" HeaderText="Major" 
                SortExpression="MajorMarks" />
            <asp:BoundField DataField="OutOfMajorMarks" HeaderText="Max. Major" 
                SortExpression="OutOfMajorMarks" />
            <asp:BoundField DataField="GradeEarned" HeaderText="Grade Earned" 
                SortExpression="GradeEarned" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                SortExpression="Comment" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
   
     <asp:SqlDataSource ID="ResultsSqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
         DeleteCommand="DELETE FROM [RESULT] WHERE [SubjectCode] = @SubjectCode AND [StudiedInSemester] = @StudiedInSemester AND [EntryNumber] = @EntryNumber" 
         InsertCommand="INSERT INTO [RESULT] ([Status], [Minor1Marks], [OutOfMinor1Marks], [Minor2Marks], [OutOfMinor2Marks], [AssignmentMarks], [OutOfAssingmentMarks], [MajorMarks], [OutOfMajorMarks], [GradeEarned], [Comment], [SubjectCode], [StudiedInSemester], [EntryNumber]) VALUES (@Status, @Minor1Marks, @OutOfMinor1Marks, @Minor2Marks, @OutOfMinor2Marks, @AssignmentMarks, @OutOfAssingmentMarks, @MajorMarks, @OutOfMajorMarks, @GradeEarned, @Comment, @SubjectCode, @StudiedInSemester, @EntryNumber)" 
         SelectCommand="SELECT [Status], [Minor1Marks], [OutOfMinor1Marks], [Minor2Marks], [OutOfMinor2Marks], [AssignmentMarks], [OutOfAssingmentMarks], [MajorMarks], [OutOfMajorMarks], [GradeEarned], [Comment], [SubjectCode], [StudiedInSemester], [EntryNumber] FROM [RESULT] WHERE (([StudiedInSemester] = @StudiedInSemester) AND ([SubjectCode] = @SubjectCode)) ORDER BY [EntryNumber]" 
         UpdateCommand="UPDATE [RESULT] SET [Status] = @Status, [Minor1Marks] = @Minor1Marks, [OutOfMinor1Marks] = @OutOfMinor1Marks, [Minor2Marks] = @Minor2Marks, [OutOfMinor2Marks] = @OutOfMinor2Marks, [AssignmentMarks] = @AssignmentMarks, [OutOfAssingmentMarks] = @OutOfAssingmentMarks, [MajorMarks] = @MajorMarks, [OutOfMajorMarks] = @OutOfMajorMarks, [GradeEarned] = @GradeEarned, [Comment] = @Comment WHERE [SubjectCode] = @SubjectCode AND [StudiedInSemester] = @StudiedInSemester AND [EntryNumber] = @EntryNumber">
         <DeleteParameters>
             <asp:Parameter Name="SubjectCode" Type="String" />
             <asp:Parameter Name="StudiedInSemester" Type="Int32" />
             <asp:Parameter Name="EntryNumber" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Status" Type="String" />
             <asp:Parameter Name="Minor1Marks" Type="Int16" />
             <asp:Parameter Name="OutOfMinor1Marks" Type="Int16" />
             <asp:Parameter Name="Minor2Marks" Type="Int16" />
             <asp:Parameter Name="OutOfMinor2Marks" Type="Int16" />
             <asp:Parameter Name="AssignmentMarks" Type="Int16" />
             <asp:Parameter Name="OutOfAssingmentMarks" Type="Int16" />
             <asp:Parameter Name="MajorMarks" Type="Int16" />
             <asp:Parameter Name="OutOfMajorMarks" Type="Int16" />
             <asp:Parameter Name="GradeEarned" Type="String" />
             <asp:Parameter Name="Comment" Type="String" />
             <asp:Parameter Name="SubjectCode" Type="String" />
             <asp:Parameter Name="StudiedInSemester" Type="Int32" />
             <asp:Parameter Name="EntryNumber" Type="String" />
         </InsertParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="SemesterDropDownList" Name="StudiedInSemester" 
                 PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="SubjectDropDownList" Name="SubjectCode" 
                 PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="Status" Type="String" />
             <asp:Parameter Name="Minor1Marks" Type="Int16" />
             <asp:Parameter Name="OutOfMinor1Marks" Type="Int16" />
             <asp:Parameter Name="Minor2Marks" Type="Int16" />
             <asp:Parameter Name="OutOfMinor2Marks" Type="Int16" />
             <asp:Parameter Name="AssignmentMarks" Type="Int16" />
             <asp:Parameter Name="OutOfAssingmentMarks" Type="Int16" />
             <asp:Parameter Name="MajorMarks" Type="Int16" />
             <asp:Parameter Name="OutOfMajorMarks" Type="Int16" />
             <asp:Parameter Name="GradeEarned" Type="String" />
             <asp:Parameter Name="Comment" Type="String" />
             <asp:Parameter Name="SubjectCode" Type="String" />
             <asp:Parameter Name="StudiedInSemester" Type="Int32" />
             <asp:Parameter Name="EntryNumber" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
   
</asp:Content>
