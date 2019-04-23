<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="DeathNote_Site.Forms.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 394px;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 313px;
        }
        .auto-style5 {
            height: 60px;
        }
        .auto-style6 {
            width: 313px;
            height: 69px;
        }
        .auto-style7 {
            height: 69px;
        }
        .auto-style8 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #000000">
        <header>

        </header>
        <div>
          <Center><table class="auto-style1" style="background-color: #FF0000">
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style8" Text="Change Password"></asp:Label>
                    </td>
                  
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Current Password :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbxCurrentPassword" runat="server" Width="210px"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="New Password :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbxNewPassword" runat="server" Width="210px"></asp:TextBox>
                    </td>
                   
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Comfirm New Password :"></asp:Label>
                     </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbxCNewPassword" runat="server" Width="210px"></asp:TextBox>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="lblFail" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="btnSave" runat="server" Height="41px" Text="Save" Width="144px" OnClick="btnSave_Click" />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnCancel" runat="server" Height="41px" Text="Cancel" Width="144px" />
                    </td>
                   
                </tr>
            </table></Center>
        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
