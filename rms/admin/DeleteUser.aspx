<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/basic.Master" CodeBehind="DeleteUser.aspx.vb" Inherits="rms.DeleteUser" %>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  
            <table style="width: 100%;  height: 662px;">
                <tr>

                    <td valign="top"; ">
                          
                        <hr />
                        <div>                   
                        <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback"></asp:Label>
                         <h2>Delete User</h2>
                        <table style="width: 100%; height: 169px;">
                           
                            <tr>
                                <td style="width: 147px">
                                   
                                    Select
                                   
                                    UserId :</td>
                                <td style="width: 288px">
            <asp:DropDownList ID="DeleteFacultyIdDropDownList" runat="server" 
                CssClass="dropbox" ValidationGroup="DeleteUser" AutoPostBack="True" DataSourceID="allUsernames" 
                                        DataTextField="UserName" DataValueField="UserName">
            </asp:DropDownList>
                                    <asp:SqlDataSource ID="allUsernames" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                        SelectCommand="SELECT [UserName] FROM [Employee]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserName" 
                                        DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" 
                                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                                        <EditItemTemplate>
                                            Name:
                                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                            <br />
                                            UserName:
                                            <asp:Label ID="UserNameLabel1" runat="server" Text='<%# Eval("UserName") %>' />
                                            <br />
                                            Type:
                                            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                            <br />
                                            EmailId:
                                            <asp:TextBox ID="EmailIdTextBox" runat="server" Text='<%# Bind("EmailId") %>' />
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <InsertItemTemplate>
                                            Name:
                                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                            <br />
                                            UserName:
                                            <asp:TextBox ID="UserNameTextBox" runat="server" 
                                                Text='<%# Bind("UserName") %>' />
                                            <br />
                                            Type:
                                            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                            <br />
                                            EmailId:
                                            <asp:TextBox ID="EmailIdTextBox" runat="server" Text='<%# Bind("EmailId") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            Name:
                                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' 
                                                style="font-weight: 700" />
                                            <br />
                                            UserName:
                                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' 
                                                style="font-weight: 700" />
                                            <br />
                                            Type:
                                            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' 
                                                style="font-weight: 700" />
                                            <br />
                                            EmailId:
                                            <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Bind("EmailId") %>' 
                                                style="font-weight: 700" />
                                            <br />
                                            <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Confirm and Delete" />
                                            &nbsp;
                                        </ItemTemplate>
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                            HorizontalAlign="Center" />
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SMVDU_CON_STRING %>" 
                                        DeleteCommand="DELETE FROM [Employee] WHERE [UserName] = @UserName" 
                                        InsertCommand="INSERT INTO [Employee] ([Name], [UserName], [Type], [EmailId]) VALUES (@Name, @UserName, @Type, @EmailId)" 
                                        SelectCommand="SELECT [Name], [UserName], [Type], [EmailId] FROM [Employee] WHERE ([UserName] = @UserName)" 
                                        UpdateCommand="UPDATE [Employee] SET [Name] = @Name, [Type] = @Type, [EmailId] = @EmailId WHERE [UserName] = @UserName">
                                        <DeleteParameters>
                                            <asp:Parameter Name="UserName" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="UserName" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="EmailId" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DeleteFacultyIdDropDownList" Name="UserName" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="EmailId" Type="String" />
                                            <asp:Parameter Name="UserName" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                           
                        </div>
                          
                    </td>
                </tr>
                </table>


</asp:Content>


