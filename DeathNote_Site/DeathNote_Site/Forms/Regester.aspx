<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regester.aspx.cs" Inherits="DeathNote_Site.Forms.Regester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 63%;
            height: 643px;
        }
        .auto-style2 {
            width: 422px;
        }
        .auto-style3 {
            width: 422px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
            height: 87px;
        }
        .auto-style5 {
            font-size: medium;
        }
        .auto-style7 {
            height: 64px;
            text-align: center;
        }
        .auto-style8 {
            width: 422px;
            text-align: center;
            height: 87px;
        }
    </style>
</head>
<body>
    <form id="frmRegester" runat="server">
        <header>

        </header>
        <div>

            <table class="auto-style1" style="background-color: #999999">
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
                        <asp:TextBox ID="tbxFirstName" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="Last Name :"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style5" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEmail" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style5" Text="Password :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style5" Text="Comfirm Password :"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="tbxComfirmPassword" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        <asp:Label ID="lblFail" runat="server" CssClass="auto-style5" ForeColor="Red" Text="Label"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Button ID="btnRegester" runat="server" CssClass="auto-style5" Height="38px" Text="Regester" Width="112px" OnClick="btnRegester_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnCancel" runat="server" CssClass="auto-style5" Height="38px" Text="Cancel" Width="112px" />
                    </td>
                    
                </tr>
            </table>

        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
