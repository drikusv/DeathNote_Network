<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="DeathNote_Site.Forms.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>

    <link rel="stylesheet" type="text/css" href="../Style/Main.css" />
    <style type="text/css">
        .auto-style2 {
            text-align: left;
            width: 271px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style5 {
            height: 60px;
        }
        .auto-style9 {
            width: 271px;
            height: 71px;
        }
        .auto-style10 {
            width: 300px;
            height: 130px;
        }
        .auto-style11 {
            text-align: left;
            width: 271px;
            height: 130px;
        }
        .auto-style12 {
            width: 300px;
            height: 71px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" >
        <header>

        </header>
        <div>
          <table class="Change">
                <tr>
                    <td colspan ="2">

                    </td>
                  
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Current Password :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbxCurrentPassword" CssClass="text" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxCurrentPassword" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="Label2" runat="server" Text="New Password :"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="tbxNewPassword" CssClass="text" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxNewPassword" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxNewPassword" ErrorMessage="must have at least 1 uppercase character, 1 lowercase character, 1 Speacial caracter, 1 number, and must be at least 6 characters long." Font-Size="14pt" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;])[A-Za-z\d@$!%*?&amp;]{8,}$"></asp:RegularExpressionValidator>
                    </td>
                   
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Comfirm New Password :"></asp:Label>
                     </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbxCNewPassword" CssClass="text" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxCNewPassword" ErrorMessage="*" Font-Bold="True" Font-Size="18pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxNewPassword" ControlToValidate="tbxCNewPassword" ErrorMessage="Passwords does not match" Font-Size="14pt" ForeColor="Red"></asp:CompareValidator>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="lblFail" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Button ID="btnSave" CssClass="button" runat="server"  Text="Save"  OnClick="btnSave_Click" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnCancel" CssClass="button" runat="server" Text="Cancel"/>
                    </td>
                </tr>
            </table>
        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
