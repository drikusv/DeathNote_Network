<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DeathNote_Site.Forms.Profile" %>

<%@ Register src="../UserControl/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 60px;
            height: 569px;
        }
        .auto-style2 {
            width: 355px;
        }
        .auto-style3 {
            width: 355px;
            text-align: center;
        }
        .auto-style5 {
            font-size: medium;
        }
        .auto-style6 {
            width: 355px;
            height: 64px;
        }
        .auto-style7 {
            height: 64px;
        }
        .auto-style8 {
            width: 355px;
            text-align: center;
            height: 87px;
        }
        .auto-style4 {
            text-align: center;
            height: 87px;
        }
        .auto-style10 {
            width: 51%;
            height: 231px;
        }
        .auto-style11 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="frmProfile" runat="server">
        <header>

            <uc1:Menu ID="Menu1" runat="server" />

        </header>
        <div>

            <table class="auto-style10" style="background-color: #999999">
                <tr>
                    <td colspan="2">&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text="First Name :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstName" runat="server" CssClass="auto-style11" ReadOnly="True" Width="310px" Height="42px"></asp:TextBox>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="Last Name :"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server" CssClass="auto-style11" ReadOnly="True" Width="310px" Height="41px"></asp:TextBox>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style5" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEmail" runat="server" CssClass="auto-style11" ReadOnly="True" Width="310px" Height="32px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7">
                        <asp:Label ID="lblFail" runat="server" CssClass="auto-style5" ForeColor="Red" Text="Faild to Update Profile" Visible="False"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Button ID="btnEdit" runat="server" CssClass="auto-style5" Height="38px" Text="Edit" Width="112px" OnClick="btnEdit_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnChangePass" runat="server" CssClass="auto-style5" Height="38px" Text="Change Password" Width="146px" OnClick="btnChangePass_Click" />
                    </td>
                    
                </tr>
            </table>

        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
