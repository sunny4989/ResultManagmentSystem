<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="SubjectAllocation.aspx.vb" Inherits="rms.SubjectAllocation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <table style="width: 100%;">
        <tr>
            <td style="width: 193px; text-decoration: underline; color: #990033">
                <b>Edit Program :</b></td>
            <td style="width: 242px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 193px">
                Select
                Program Name:</td>
            <td colspan="2">
                <asp:DropDownList ID="ProgramNameDropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram"
                    DataSourceID="AllDepartmentSqlDataSource1" DataTextField="ProgramName" 
                    DataValueField="ProgramCode">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 193px; height: 48px;">
                Select
                Semester :</td>
            <td>
                <asp:DropDownList ID="SemsterDropDownList" runat="server" 
                    ValidationGroup="AddProgram">
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Submit" />
            </td>
            <td style="height: 48px">
                &nbsp;</td>
               

        </tr>
        </table>

    <asp:Panel ID="Panel1" runat="server"
        ViewStateMode="Enabled" >

        <table style="width: 100%;">
        <tr valign="top">
            <td style="width: 193px; text-decoration: underline; color: #CC0000; height: 24px;">
                <b>Allocate Subjects:</b></td>
            <td style="width: 242px; height: 24px;" valign="top">
            </td>
            <td style="height: 24px" valign="top">
            </td>

        </tr>
        <tr>
            <td style="width: 193px">
                Subject 1:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject1DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="SubjectRequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject1DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 2:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject2DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject2RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject2DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 3:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject3DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject3RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject3DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 4:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject4DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject4RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject4DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 5:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject5DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject5RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject5DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 6:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject6DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject6RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject6DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 7:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject7DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject7RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject7DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 8:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject8DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject8RequiredFieldValidator" runat="server" 
                    ControlToValidate="Subject8DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                &nbsp;</td>
            <td style="width: 242px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 193px; color: #990033; text-decoration: underline;">
                <b>What to Add Extra Subject :</b></td>
            <td style="width: 242px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 9:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject9DropDownList" runat="server" Height="26px" 
                    ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="Subject9RequiredFieldValidator0" runat="server" 
                    ControlToValidate="Subject9DropDownList" ErrorMessage="Data Selection Required" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddProgram"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 193px">
                Subject 10:</td>
            <td style="width: 242px">
                <asp:DropDownList ID="Subject10DropDownList" runat="server" 
                    Height="26px" ValidationGroup="AddProgram" Width="179px" 
                    DataSourceID="AllSubjectSqlDataSource" DataTextField="SubName" 
                    DataValueField="SubCode">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 193px">
                &nbsp;</td>
            <td style="width: 242px">
                <asp:Button ID="AddExtraSubjectButton" runat="server" Text="Submit" 
                    ToolTip="Click to Create All Defined Subject" ValidationGroup="AddProgram" 
                    Width="167px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 193px">
                <asp:SqlDataSource ID="AllSubjectSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [SubCode], [SubName] FROM [SUBJECT]">
                </asp:SqlDataSource>
            </td>
            <td style="width: 242px">
                <asp:SqlDataSource ID="AllDepartmentSqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [ProgramCode], [ProgramName] FROM [PROGRAMMES]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   </asp:Panel>
</asp:Content>
