<%@ Page Title="" Language="vb" AutoEventWireup="true"  MasterPageFile="~/basic.Master" CodeBehind="SemesterResult.aspx.vb" Inherits="rms.SemesterResult" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
    <table style="width:100%;">
        <tr>
            <td style="color: #990033; text-decoration: underline; width: 201px">
                <b>Enter Required Information :</b></td>
            <td style="width: 168px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 201px">
                Program :</td>
            <td style="width: 168px">
                <asp:DropDownList ID="ProgramDropDownList" runat="server" CssClass="DropBox" 
                    ValidationGroup="SemesterResult" DataSourceID="SqlDataSource1" 
                    DataTextField="ProgramName" DataValueField="ProgramCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                    SelectCommand="SELECT [ProgramCode], [ProgramName] FROM [PROGRAMMES]">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ProgramRequiredFieldValidator" runat="server" 
                    ControlToValidate="ProgramDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection Required" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SemesterResult"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 201px">
                Semester :</td>
            <td style="width: 168px">
            <asp:DropDownList ID="SemsterDropDownList" runat="server" 
                ValidationGroup="SemesterResult">
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
                <asp:RequiredFieldValidator ID="ProgramRequiredFieldValidator0" runat="server" 
                    ControlToValidate="SemsterDropDownList" Display="Dynamic" 
                    ErrorMessage="Selection Required" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SemesterResult"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 201px">
                &nbsp;</td>
            <td style="width: 168px">
                <asp:Button ID="Button1" runat="server" CssClass="DropBox" Text="Show Result" 
                    ValidationGroup="SemesterResult" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <hr />
    <asp:Panel ID="Panel1" runat="server">
        <asp:BulletedList ID="ResultBulletedList" runat="server" BulletStyle="Numbered" 
            ForeColor="#990033">
        </asp:BulletedList>
    </asp:Panel>
    

</asp:Content>
