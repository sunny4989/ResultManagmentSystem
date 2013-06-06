<%@ Page Title="" Language="vb" AutoEventWireup="true"  MasterPageFile="~/basic.Master" CodeBehind="SemesterCheckResult.aspx.vb" Inherits="rms.SemesterCheckResult" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    ValidationGroup="SemesterResult">
                </asp:DropDownList>
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
                    <asp:ListItem>I</asp:ListItem>
                    <asp:ListItem>II</asp:ListItem>
                    <asp:ListItem>III</asp:ListItem>
                    <asp:ListItem>IV</asp:ListItem>
                    <asp:ListItem>V</asp:ListItem>
                    <asp:ListItem>VI</asp:ListItem>
                    <asp:ListItem>VII</asp:ListItem>
                    <asp:ListItem>VIII</asp:ListItem>
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
                <asp:Button ID="Button1" runat="server" CssClass="DropBox" Text="Button" 
                    ValidationGroup="SemesterResult" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
