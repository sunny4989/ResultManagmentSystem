<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="AddStudent.aspx.vb" Inherits="rms.AddStudent" %>


<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    
            <table style="width: 100%;  height: 465px;">
                <tr>
                
                    <td valign="top";">
                    <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
                    <h2>Register a new Student</h2>
                        <table style="width: 100%; height: 396px;">
                            <tr>
                                <td style="width: 144px">
                                    Entry Number :</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="EntryNoTextBox" runat="server" MaxLength="13" Width="197px" 
                                        CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="EntryNumberRequiredFieldValidator" 
                                        runat="server" ControlToValidate="EntryNoTextBox" Display="Dynamic" 
                                        ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Name :
                                </td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="NameTextBox" runat="server" MaxLength="26" Width="197px" 
                                        CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator0" runat="server" 
                                        ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="Data Required" 
                                        ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Date Of Birth:</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="DOBTextBox" runat="server" Width="197px" CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>(dd/mm/yyyy)
                                    <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator" runat="server" 
                                        ControlToValidate="DOBTextBox" Display="Dynamic" ErrorMessage="Data Required" 
                                        ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Father Name :</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="FatherNameTextBox" runat="server" MaxLength="26" Width="197px" 
                                        CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="FatherNameRequiredFieldValidator" 
                                        runat="server" ControlToValidate="FatherNameTextBox" Display="Dynamic" 
                                        ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    sex :</td>
                                <td style="width: 298px">
                                    <asp:DropDownList ID="genderDropDownList" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Program Code :</td>
                                <td style="width: 298px">
                                    <asp:DropDownList ID="ProgramEnrolledDropDown" runat="server" 
                                        DataSourceID="ProgramsOfferedSqlDataSource" DataTextField="ProgramName" 
                                        DataValueField="ProgramCode">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="ProgramsOfferedSqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                        SelectCommand="SELECT [ProgramName], [ProgramCode] FROM [PROGRAMMES]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Mobile Number :
                                </td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="MobileNoTextBox" runat="server" MaxLength="13" Width="197px" 
                                        CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Email-Id :</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="EmailIdTextBox" runat="server" MaxLength="26" Width="197px" 
                                        CssClass="DropBox"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Parmanent Address :</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="ParentAddressTextBox" runat="server" MaxLength="111" 
                                        Width="293px" Height="69px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="ProgramCodeRequiredFieldValidator0" 
                                        runat="server" ControlToValidate="ParentAddressTextBox" Display="Dynamic" 
                                        ErrorMessage="Data Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    Temprory Address :</td>
                                <td style="width: 298px">
                                    <asp:TextBox ID="TemprorayAddressTextBox" runat="server" MaxLength="111" 
                                        Width="293px" Height="65px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 144px">
                                    &nbsp;</td>
                                <td style="width: 298px">
                                    <asp:Button ID="AddStudentButton" runat="server" Text="Add Student" 
                                        Width="168px" CssClass="DropBox" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>


</asp:Content>


