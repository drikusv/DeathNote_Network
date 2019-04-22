<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DeathNote_Site.Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login</title>

    <style type="text/css">
        .auto-style1 {
            width: 49%;
            height: 487px;
        }
        .auto-style2 {
            width: 269px;
        }
        .auto-style3 {
            width: 269px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 269px;
            height: 52px;
        }
        .auto-style6 {
            height: 52px;
        }
        .auto-style7 {
            width: 269px;
            text-align: center;
            height: 73px;
        }
        .auto-style8 {
            text-align: center;
            height: 73px;
        }
        .auto-style9 {
            font-size: medium;
        }
        .auto-style10 {
            font-size: large;
        }
    </style>
    
</head>
<body>
    <form id="frmLogin" runat="server">
        <header>

        </header>
        <div>
            <center>
            <table class="auto-style1" style="background-color: #999999">
                <tr>
                    <td colspan="2" style="text-align: center;" class="auto-style9">Login</td>
                   
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style9" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEmail" runat="server" CssClass="auto-style9" Width="247px"></asp:TextBox>
                    </td>
                   
                </tr>
                  <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style9" Text="Password :"></asp:Label>
                      </td>
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" CssClass="auto-style9" TextMode="Password" Width="250px"></asp:TextBox>
                      </td>
                   
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">
                        <asp:CheckBox ID="cbxRemember" runat="server" CssClass="auto-style10" Text="Remember me next time" />
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">
                        <asp:Label ID="lblWarrning" runat="server" BorderColor="Red" CssClass="auto-style9" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    </td>
                   
                </tr>
                 <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6"></td>
                    
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="btnLogin" runat="server" BackColor="Silver" BorderColor="Gray" BorderStyle="Solid" CssClass="auto-style9" Height="38px" Text="Login" Width="103px" OnClick="btnLogin_Click" />
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnRegester" runat="server" BackColor="Silver" BorderColor="Gray" BorderStyle="Solid" CssClass="auto-style9" Height="38px" Text="Regester" Width="103px" OnClick="btnRegester_Click" />
                    </td>
                   
                </tr>
            </table>
            </center>

        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
