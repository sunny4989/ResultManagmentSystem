<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="ManageFaculty.aspx.vb" Inherits="rms.ManageFaculty1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 133px;">
        <tr>
            <td style="width: 141px; color: #990033; text-decoration: underline">
                <b>Change Password :</b></td>
            <td style="width: 196px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 141px">
                Old Password :</td>
            <td style="width: 196px">
                <asp:TextBox ID="ChangeOldPasswordTextBox" runat="server" CssClass="DropBox" 
                    MaxLength="50" ValidationGroup="ChangePassword:" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ChangeOldPasswordRequiredFieldValidator" 
                    runat="server" ControlToValidate="ChangeOldPasswordTextBox" 
                    ErrorMessage="Password Required" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic" ValidationGroup="ChangePassword:"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 141px">
                New Pawword :</td>
            <td style="width: 196px">
                <asp:TextBox ID="ChangeNewPasswordTextBox" runat="server" CssClass="DropBox" 
                    MaxLength="50" ValidationGroup="ChangePassword:" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ChangeNewPasswordRequiredFieldValidator" 
                    runat="server" ControlToValidate="ChangeNewPasswordTextBox" 
                    ErrorMessage="Password Required" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic" ValidationGroup="ChangePassword:"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 141px">
                Confirm Password :</td>
            <td style="width: 196px">
                <asp:TextBox ID="ChangeConfirmPasswordTextBox" runat="server" 
                    CssClass="DropBox" MaxLength="50" ValidationGroup="ChangePassword:" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ChangeConfirmPasswordRequiredFieldValidator" 
                    runat="server" ControlToValidate="ChangeConfirmPasswordTextBox" 
                    ErrorMessage="Password Required" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic" ValidationGroup="ChangePassword:"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="ChangePasswordCompareValidator" runat="server" 
                    ControlToCompare="ChangeNewPasswordTextBox" 
                    ControlToValidate="ChangeConfirmPasswordTextBox" 
                    ErrorMessage="Password Miss-Match" ForeColor="Red" Display="Dynamic" 
                    SetFocusOnError="True" ValidationGroup="ChangePassword:"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 141px">
                &nbsp;</td>
            <td style="width: 196px">
                <asp:Button ID="Button1" runat="server" CssClass="DropBox" Text="Button" 
                    ValidationGroup="ChangePassword:" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <hr />
    <table style="width: 100%;">
        <tr>
            <td style="width: 138px">
                &nbsp;<span style="text-decoration: underline; color: #990033"><b> Update 
                Account:</b></span></td>
            <td style="width: 200px">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 138px">
                &nbsp;
                Name :</td>
            <td style="width: 200px">
                &nbsp;
                <asp:TextBox ID="UpdateNameTextBox" runat="server" CssClass="DropBox" 
                    MaxLength="26" ValidationGroup="UpdateAccount"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="UpdateNameRequiredFieldValidator" 
                    runat="server" ControlToValidate="UpdateNameTextBox" 
                    ErrorMessage="Name Required" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 138px">
                &nbsp;
                Email-ID :</td>
            <td style="width: 200px">
                &nbsp;
                <asp:TextBox ID="UpdateEmailIdTextBox" runat="server" CssClass="DropBox" 
                    MaxLength="26" ValidationGroup="UpdateAccount"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="UpdateEmailIdRequiredFieldValidator" 
                    runat="server" ControlToValidate="UpdateEmailIdTextBox" 
                    ErrorMessage="Name Required  ." ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailIdRegularExpressionValidator" 
                    runat="server" ControlToValidate="UpdateEmailIdTextBox" Display="Dynamic" 
                    ErrorMessage="   Incorrect Email Id ." ForeColor="Red" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="UpdateAccount"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 138px">
                &nbsp;</td>
            <td style="width: 200px">
                <asp:Button ID="Button2" runat="server" CssClass="DropBox" Text="Button" 
                    ValidationGroup="UpdateAccount" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
