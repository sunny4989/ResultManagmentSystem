<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="StudentResult.aspx.vb" Inherits="rms.StudentResult" %>
 
 

  <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
      <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
      <table style="width:100%;">
        <tr>
            <td style="color: #990033; text-decoration: underline; " colspan="3">
                <b>Enter Required Information :</b></td>
        </tr>
        <tr>
            <td style="width: 201px">
                Entry Number :</td>
            <td style="width: 168px">
                <asp:TextBox ID="EntryNumberTextBox" runat="server" CssClass="DropBox" MaxLength="13" 
                    ValidationGroup="ResultByName"></asp:TextBox>
            </td>
            <td style="width: 168px">
                <asp:RequiredFieldValidator ID="ProgramRequiredFieldValidator1" runat="server" 
                    ControlToValidate="EntryNumberTextBox" Display="Dynamic" 
                    ErrorMessage="Selection Required" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SemesterResult"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 201px">
                Semester: </td>
            <td style="width: 168px">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="ListofSemestersSqlDataSource1" DataTextField="Semester" 
                    DataValueField="SemesterValue">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ListofSemestersSqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [SemesterValue], [Semester] FROM [List_semesters]">
                </asp:SqlDataSource>
            </td>
            <td style="width: 168px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 201px">
                &nbsp;</td>
            <td style="width: 168px; font-size: large; color: #CC0066;">
                <asp:Button ID="ByEntryNumberButton" runat="server" CssClass="DropBox" Text="Submit" 
                    ValidationGroup="SemesterResult" />
            </td>
            <td style="width: 168px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 201px">
                &nbsp;</td>
            <td style="width: 168px; font-size: large; color: #CC0066;">
                &nbsp;</td>
            <td style="width: 168px">
                &nbsp;</td>
        </tr>
        </table>
    <hr />
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataSourceID="StudentResultInsemester" 
            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" 
            SortExpression="SubjectCode" >
                <ItemStyle ForeColor="#660033" />
                </asp:BoundField>
                <asp:BoundField DataField="SubName" HeaderText="SubName" 
            SortExpression="SubName" >
                <ItemStyle ForeColor="#660033" />
                </asp:BoundField>
                <asp:BoundField DataField="Credit" HeaderText="Credit" 
            SortExpression="Credit" >
                <ItemStyle ForeColor="#660033" />
                </asp:BoundField>
                <asp:BoundField DataField="GradeEarned" HeaderText="GradeEarned" 
            SortExpression="GradeEarned" >
                <ItemStyle ForeColor="#660033" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="StudentResultInsemester" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
    
            SelectCommand="SELECT RESULT.SubjectCode, SUBJECT.SubName, SUBJECT.Credit, RESULT.GradeEarned FROM SUBJECT INNER JOIN RESULT ON SUBJECT.SubCode = RESULT.SubjectCode INNER JOIN Grading ON RESULT.GradeEarned = Grading.Grade WHERE (RESULT.EntryNumber = @entryno) AND (RESULT.StudiedInSemester = @semester) ORDER BY RESULT.SubjectCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="EntryNumberTextBox" Name="entryno" 
            PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="semester" 
            PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="sgpa_and_cgpa_label" runat="server"></asp:Label>

    </asp:Panel>
 </asp:Content>
