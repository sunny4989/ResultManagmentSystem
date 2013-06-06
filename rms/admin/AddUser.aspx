<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="AddUser.aspx.vb" Inherits="rms.AddUser" %>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  
           <table style="width: 100%;  height: 662px;">
                <tr>

                    <td valign="top";">
                          
                        <hr />
                        <div>
                         <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
                        <table style="width: 100%; height: 169px;">
                            <tr>
                                <td style="width: 147px; text-decoration: underline; color: #990033">
                                    <b>Add new User :</b></td>
                                <td style="width: 288px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    &nbsp;</td>
                                <td style="width: 288px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    UserType :</td>
                                <td style="width: 288px">
                                    <asp:DropDownList ID="uTypeDropbox" runat="server" CssClass="dropbox" 
                                        DataSourceID="usertypes" DataTextField="Usertypes" 
                                        DataValueField="Usertypes" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="usertypes" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                        SelectCommand="SELECT [Usertypes] FROM [usertype]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    &nbsp;</td>
                                <td colspan="2">
                                <asp:Panel ID="SelectFacultyNamePanel" runat="server">
                                    Select the faculty this username will be assigned to (if faculty name is not 
                                    avaible, please first add a faculty from <a href="addfaculty.aspx" title"Click to add a new faculty">here</a> 
                                    )<br />List of faculties who doesn't have username:
                                    <asp:DropDownList ID="FacultyIDDropDownList" runat="server" 
                                        DataSourceID="AvailableFacultiesSqlDataSource" DataTextField="FacultyName" 
                                        DataValueField="FacultyID" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="AvailableFacultiesSqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                        
                                        SelectCommand="SELECT [FacultyID], [FacultyName], [departmentid] FROM [Faculty]  where FacultyID Not In (select FacultyID from facultyhasusename) ">
                                    </asp:SqlDataSource>

                                </asp:Panel>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                    <td style="width: 148px">
            Required Username :</td>
                                    <td style="width: 285px">
            <asp:TextBox ID="UsernameTexbox" runat="server" Width="230px" 
                CssClass="dropbox"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            <tr>
                                    <td style="width: 148px">
                                        &nbsp;</td>
                                    <td style="width: 285px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            <tr>
                                    <td style="width: 148px">
                                        Password:</td>
                                    <td style="width: 285px">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" MaxLength="50" 
                                        Width="236px" ValidationGroup="ChangePassword" CssClass="dropbox" 
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="DeletePasswordRequiredFieldValidator0" 
                                            runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" 
                                            ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            <tr>
                                    <td style="width: 148px">
                                        Confirm Password:</td>
                                    <td style="width: 285px">
                                    <asp:TextBox ID="ConfirmPasswordTextBox0" runat="server" MaxLength="50" 
                                        Width="236px" ValidationGroup="ChangePassword" CssClass="dropbox" 
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="DeleteConfirmPasswordRequiredFieldValidator5" 
                                            runat="server" ControlToValidate="ConfirmPasswordTextBox0" Display="Dynamic" 
                                            ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="ConfirmPasswordCompareValidator0" runat="server" 
                                            ControlToCompare="PasswordTextBox" 
                                            ControlToValidate="ConfirmPasswordTextBox0" Display="Dynamic" 
                                            ErrorMessage="Password Miss-match" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationGroup="ChangePassword"></asp:CompareValidator>
                                    </td>
                                </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    &nbsp;</td>
                                <td style="width: 288px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    Name: </td>
                                <td style="width: 288px">
                                    <asp:TextBox ID="NameTextbox" runat="server" CssClass="dropbox"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    Email ID: </td>
                                <td style="width: 288px">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="dropbox"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                   
                                    &nbsp;</td>
                                <td style="width: 288px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 147px">
                                    &nbsp;</td>
                                <td style="width: 288px">
                                    <asp:Button ID="addUserButton" runat="server" Height="34px" Text="Submit" 
                                        Width="161px" ValidationGroup="DeleteUser" CssClass="DropBox" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <hr />
                            
                        </div>
                          
                    </td>
                </tr>
                </table>


</asp:Content>


