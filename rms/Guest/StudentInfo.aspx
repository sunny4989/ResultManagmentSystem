<%@ Page Title="" Language="vb" AutoEventWireup="true"  MasterPageFile="~/basic.Master" CodeBehind="StudentInfo.aspx.vb" Inherits="rms.StudentInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <asp:RequiredFieldValidator ID="ProgramRequiredFieldValidator2" runat="server" 
                    ControlToValidate="EntryNumberTextBox" Display="Dynamic" 
                    ErrorMessage="Selection Required" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SemesterResult"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 201px">
                &nbsp;</td>
            <td style="width: 168px">
                <asp:Button ID="ByEntryNumberButton0" runat="server" CssClass="DropBox" Text="Submit" 
                    ValidationGroup="SemesterResult" />
            </td>
            <td style="width: 168px">
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">


    </asp:Panel>
</asp:Content>
