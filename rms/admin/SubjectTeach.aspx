<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="SubjectTeach.aspx.vb" Inherits="rms.SubjectTeach" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <h2>
        Assign Subjects to Faculty</h2>
    <div>
        <table style="width: 100%; height: 229px;">
            <tr>
                <td style="width: 108px">
                    &nbsp;
                </td>
                <td style="width: 275px">
                    &nbsp;
                </td>
                <td>
                    Teachers assigned
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    Subject Code :
                </td>
                <td style="width: 275px">
                    <asp:DropDownList ID="SubjectCodeDropDownList" runat="server" AutoPostBack="True"
                        DataSourceID="AllSubjectSqlDataSource1" DataTextField="SubCode" DataValueField="SubCode">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="FacultyAssignedSqlDataSource"
                        DataTextField="FacultyName" DataValueField="FacultyName">
                    </asp:BulletedList>
                    <asp:SqlDataSource ID="FacultyAssignedSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>"
                        SelectCommand="SELECT Faculty.FacultyName FROM Faculty INNER JOIN TEACH_BY ON Faculty.FacultyID = TEACH_BY.FacultyId WHERE (TEACH_BY.SubjectCode = @subjectCode)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SubjectCodeDropDownList" Name="subjectCode" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:Label ID="SubjectNameLabel" runat="server" Text="Subject Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    Teacher Name :
                </td>
                <td style="width: 275px">
                    <asp:DropDownList ID="AddTeacherNameDropDownList" runat="server" Height="21px" Width="161px"
                        ValidationGroup="AddTeachBy" CssClass="DropBox" DataSourceID="FacultyListSqlDataSource"
                        DataTextField="FacultyName" DataValueField="FacultyID" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:SqlDataSource ID="AllSubjectSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>"
                        SelectCommand="SELECT [SubCode] FROM [SUBJECT] WHERE ([SubCode] &lt;&gt; @SubCode)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="SubCode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    &nbsp;
                </td>
                <td style="width: 275px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:Button ID="AddButton" runat="server" Text="Assign" Width="141px" Height="27px"
                        ValidationGroup="AddTeachBy" CssClass="DropBox" />
                </td>
            </tr>
            <tr>
                <td style="width: 108px">
                    &nbsp;
                </td>
                <td style="width: 275px">
                    &nbsp;
                </td>
                <td>
                    <asp:SqlDataSource ID="FacultyListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>"
                        SelectCommand="SELECT [FacultyID], [FacultyName] FROM [Faculty]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    <hr />
    <div>
        <b style="text-decoration: underline; color: #990033">Delete Subject Teach By Teacher
            :</b>
        <table style="width: 100%; height: 262px;">
            <tr>
                <td style="width: 106px">
                    Subject 
                    Code :&nbsp;
                </td>
                <td style="width: 234px">
                    <asp:DropDownList ID="DeleteSubjectCodeDropDownList" runat="server" ValidationGroup="DeleteTeachBy"
                        Height="27px" Width="125px" CssClass="DropBox" AutoPostBack="True" 
                        DataSourceID="SubjectCodesSqlDataSource1" DataTextField="SubCode" 
                        DataValueField="SubCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SubjectCodesSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                        SelectCommand="SELECT [SubCode] FROM [SUBJECT] WHERE ([SubCode] &lt;&gt; @SubCode)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="SubCode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;
                    Teachers assigned
                </td>
            </tr>
            <tr>
                <td style="width: 106px">
                    &nbsp;
                </td>
                <td style="width: 234px">
                    &nbsp;</td>
                <td>
                   
                    <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="GetTeacherAssignedSqlDataSource2"
                        DataTextField="FacultyName" DataValueField="FacultyName">
                    </asp:BulletedList>
                    <asp:SqlDataSource ID="GetTeacherAssignedSqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                        
                        SelectCommand="SELECT Faculty.FacultyName, Faculty.FacultyID FROM Faculty INNER JOIN TEACH_BY ON Faculty.FacultyID = TEACH_BY.FacultyId WHERE (TEACH_BY.SubjectCode = @subcode)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DeleteSubjectCodeDropDownList" Name="subcode" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 106px">
                    &nbsp;Faculty Name :
                </td>
                <td style="width: 234px">
                    <asp:DropDownList ID="DeleteFacultyNameDropDownList" runat="server" Height="27px"
                        ValidationGroup="DeleteTeachBy" Width="125px" CssClass="DropBox" 
                        DataSourceID="GetTeacherAssignedSqlDataSource2" DataTextField="FacultyName" 
                        DataValueField="FacultyID">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 106px">
                    &nbsp;
                </td>
                <td style="width: 234px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 106px">
                    &nbsp;</td>
                <td style="width: 234px">
                    <asp:Button ID="DeleteButton" runat="server" Height="28px" Text="Delete" ValidationGroup="DeleteTeachBy"
                        Width="126px" CssClass="DropBox" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 106px">
                    &nbsp;</td>
                <td colspan="2">
                        <asp:Label ID="FeedbackDeleteSubjectAllocationLabel" runat="server" CssClass="feedback"></asp:Label>
                    &nbsp;</td>
            </tr>
           
         
        </table>
    </div>
</asp:Content>
