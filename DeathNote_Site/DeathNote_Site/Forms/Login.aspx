<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DeathNote_Site.Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login</title>
   
   
    <link type="text/css" href="../Style/Main.css" rel="stylesheet" />
    

    <style type="text/css">
        .auto-style2 {
            width: 319px;
        }
        .auto-style3 {
            width: 319px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style7 {
            width: 319px;
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
            width: 319px;
            text-align: center;
            height: 54px;
        }
        .auto-style11 {
            height: 54px;
        }
    </style>
    
</head>
<body>
    <form id="frmLogin" runat="server">
        <header>

            <h1 class ="LoginHeader">Welcome to DeathNote</h1>

        </header>
        <div>
            
            <table class="Login">
                <tr>
                    <td colspan="2" style="text-align: center;" >Login</td>
                   
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="Label1" CssClass="Lable" runat="server"  Text="Email :"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="tbxEmail" runat="server" Width="247px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" ErrorMessage="*" ForeColor="Red" Font-Bold="True" Font-Size="18pt"></asp:RequiredFieldValidator>
                    </td>
                   
                </tr>
                  <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" CssClass="Lable"  runat="server"  Text="Password :"></asp:Label>
                      </td>
                    <td>
                        <asp:TextBox ID="tbxPassword" runat="server" CssClass="auto-style9" TextMode="Password" Width="250px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" ErrorMessage="*" ForeColor="Red" Font-Bold="True" Font-Size="18pt"></asp:RequiredFieldValidator>
                      </td>
                   
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">
                        <asp:CheckBox ID="cbxRemember" runat="server"  Text="Remember me next time" />
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2" class="auto-style4">
                        <asp:Label ID="lblWarrning" runat="server" CssClass="Lable" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnRegester" CssClass="button" runat="server" Text="Regester" OnClick="btnRegester_Click" CausesValidation="False" />
                    </td>
                   
                </tr>
            </table>
            

        </div>
        <footer>

        </footer>
    </form>
</body>
</html>

<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="../Scripts/LoginScript.js"></script>--%>
