<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="rms.ChangePassword" %>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  
            <table style="width: 100%;  height: 662px;">
                <tr>

                    <td valign="top";">
                          

                    
                      
                        <hr />
                        <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>

                            <table style="width: 100%; height: 320px;">
                                <tr>
                                    <td style="width: 148px; color: #990033; text-decoration: underline; height: 36px;">
                                        <b>Reset Password : </b>
                                    </td>
                                    <td style="width: 285px; height: 36px;">
                                        </td>
                                    <td style="height: 36px">
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 148px; height: 37px;">
                                        Select
                                        User :</td>
                                    <td style="width: 285px; height: 37px;">
            <asp:DropDownList ID="UserNameDropDownList" runat="server" 
                CssClass="dropbox" ValidationGroup="DeleteUser" DataSourceID="UsersUniversity" 
                                            DataTextField="UserName" DataValueField="UserName">
            </asp:DropDownList>
                                    </td>
                                    <td style="height: 37px">
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 148px; height: 26px;">
                                        New
                                        Password:</td>
                                    <td style="width: 285px; height: 26px;">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" MaxLength="50" 
                                        Width="236px" ValidationGroup="ChangePassword" CssClass="DropBox" 
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td style="height: 26px">
                                        <asp:RequiredFieldValidator ID="DeletePasswordRequiredFieldValidator" 
                                            runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" 
                                            ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 148px; height: 25px;">
                                        Confirm new Password:</td>
                                    <td style="width: 285px; height: 25px;">
                                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" MaxLength="50" 
                                        Width="236px" ValidationGroup="ChangePassword" CssClass="DropBox" 
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td style="height: 25px">
                                        <asp:RequiredFieldValidator ID="DeleteConfirmPasswordRequiredFieldValidator4" 
                                            runat="server" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" 
                                            ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="ConfirmPasswordCompareValidator" runat="server" 
                                            ControlToCompare="PasswordTextBox" 
                                            ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" 
                                            ErrorMessage="Password Miss-match" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 148px; height: 36px;">
                                        </td>
                                    <td style="width: 285px; height: 36px;">
                                        <asp:Button ID="Button" runat="server" Height="31px" Text="Change Password " 
                                            Width="194px" ValidationGroup="ChangePassword" CssClass="DropBox" />
                                    </td>
                                    <td style="height: 36px">
                                        </td>
                                        <hr />
                                </tr>
                                <asp:SqlDataSource ID="UsersUniversity" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                    SelectCommand="SELECT [UserName] FROM [Employee]"></asp:SqlDataSource>
                                
                                </table>
                               
                    
                          
                    </td>
                </tr>
                </table>


</asp:Content>


