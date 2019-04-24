<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regester.aspx.cs" Inherits="DeathNote_Site.Forms.Regester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Style/Main.css" />
    <style type="text/css">
        .auto-style2 {
            width: 500px;
        }
        .auto-style3 {
            width: 500px;
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
            width: 500px;
            text-align: center;
            height: 87px;
        }
        .auto-style10 {
            font-size: xx-large;
        }
        .auto-style11 {
            text-align: center;
            height: 72px;
        }
        .auto-style12 {
            width: 500px;
            text-align: center;
            height: 105px;
        }
        .auto-style13 {
            height: 105px;
        }
    </style>
</head>
<body>
    <form id="frmRegester" runat="server">
        <header>

        </header>
        <div>

            <table class="Regestration" style="width: 1026px">
                <tr>
                    <td colspan="2" class="auto-style11">
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style10" Text="Regester"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" CssClass="Lable" Text="First Name :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstName" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red" ControlToValidate="tbxFirstName"></asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" CssClass="Lable" Text="Last Name :"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red" ControlToValidate="tbxLastName"></asp:RequiredFieldValidator>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" CssClass="Lable" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEmail" runat="server" CssClass="auto-style5" Width="310px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red" ControlToValidate="tbxEmail"></asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="Label4" runat="server" CssClass="Lable" Text="Password :"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="tbxPassword" runat="server" CssClass="auto-style5" Width="310px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxPassword" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxPassword" ErrorMessage="must have at least 1 uppercase character, 1 lowercase character, 1 Speacial caracter, 1 number, and must be at least 6 characters long." Font-Size="14pt" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;])[A-Za-z\d@$!%*?&amp;]{8,}$"></asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" CssClass="Lable" Text="Comfirm Password :"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="tbxComfirmPassword" runat="server" CssClass="auto-style5" Width="310px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxPassword" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxPassword" ControlToValidate="tbxComfirmPassword" ErrorMessage="Passwords does not match" Font-Size="14pt" ForeColor="Red"></asp:CompareValidator>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Button ID="btnRegester" runat="server" CssClass="button" Height="38px" Text="Regester" Width="112px" OnClick="btnRegester_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnCancel" runat="server" CssClass="button" Height="38px" Text="Cancel" Width="112px" OnClick="btnCancel_Click" CausesValidation="False" />
                    </td>
                    
                </tr>
            </table>

        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
