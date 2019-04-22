<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="DeathNote_Site.Forms.Friends" %>

<%@ Register src="../UserControl/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 385px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
            width: 509px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>

            <uc1:Menu ID="Menu1" runat="server" />

        </header>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Friends"></asp:Label>
                        <br />
                        <asp:Panel ID="Panel1" runat="server" Height="750px">
                            <asp:DataList ID="dlistFriends" runat="server">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel4" runat="server" Height="43px" BorderColor="#999999" BorderStyle="Solid">
                                        <asp:Label ID="lblNameF" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        <asp:Label ID="lblSurnameF" runat="server" Text='<%# Eval("Surname") %>'></asp:Label>
                                        <br />
                                        <asp:CheckBox ID="cbxActiveF" runat="server" Text="Active" Checked ='<%# Eval("UserActive") %>' />
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Friend Request"></asp:Label>
                        <br />
                        <asp:Panel ID="Panel2" runat="server" Height="750px">
                            <asp:DataList ID="dlistRequest" runat="server" OnItemCommand="dlistRequest_ItemCommand">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel5" runat="server" Height="72px" BorderColor="Gray" BorderStyle="Solid" Width="223px">
                                        <asp:Label ID="lblNameR" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        <asp:Label ID="lblSurnameR" runat="server" Text='<%# Eval("SurName") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblEmailR" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        <br />
                                        <asp:Button ID="btnAcceptR" runat="server" Text="Accept" OnClick="btnAcceptR_Click" />
                                        <asp:Button ID="btnDeclineR" runat="server" Text="Decline" OnClick="btnDeclineR_Click" />
                                        
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Users"></asp:Label>
                        <br />
                        <asp:Panel ID="Panel3" runat="server" Height="750px">
                            <asp:DataList ID="dlistUsers" runat="server">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel6" runat="server" Height="72px" BorderColor="Gray" BorderStyle="Solid">
                                        <asp:Label ID="lblNameU" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                        <asp:Label ID="lblSurnameU" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblEmailU" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        <br />
                                        <asp:Button ID="btnAdd" runat="server" Text="Add Friend" OnClick="btnAdd_Click" />
                                        
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            
        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
