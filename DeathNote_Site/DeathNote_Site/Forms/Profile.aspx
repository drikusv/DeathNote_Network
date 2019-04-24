<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DeathNote_Site.Forms.Profile" %>

<%@ Register src="../UserControl/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Style/Main.css" />
    <style type="text/css">

        .auto-style2 {
            width: 355px;
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
        .auto-style15 {
            text-align: center;
            height: 71px;
            font-size: larger;
        }
        .auto-style18 {
            height: 71px;
        }
        .auto-style20 {
            width: 406px;
            text-align: center;
            height: 71px;
        }
        .auto-style21 {
            width: 406px;
            text-align: center;
            height: 70px;
        }
        .auto-style22 {
            height: 70px;
        }
        .auto-style23 {
            width: 406px;
            text-align: center;
            height: 72px;
        }
        .auto-style24 {
            height: 72px;
        }
        .auto-style25 {
            height: 71px;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="frmProfile" runat="server">
        <header>

            <uc1:Menu ID="Menu1" runat="server" />

        </header>
        <div>
            <table class="Profile">
                <tr>
                    <td colspan="2" class="auto-style18">Profile</td>
                    
                </tr>
                <tr>
                    <td class="auto-style21">
                        <asp:Label ID="Label1" runat="server" CssClass="Lable" Text="First Name :"></asp:Label>
                    </td>
                    <td class="auto-style22">
                        <asp:TextBox ID="tbxFirstName" runat="server" CssClass="text" ReadOnly="True"></asp:TextBox>
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label2" runat="server" CssClass="Lable" Text="Last Name :"></asp:Label>
                     </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="tbxLastName" runat="server" CssClass="text" ReadOnly="True"></asp:TextBox>
                     </td>
                    
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label3" runat="server" CssClass="Lable" Text="Email :"></asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="tbxEmail" runat="server" CssClass="text" ReadOnly="True" ></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style25" colspan="2">
                        <asp:Label ID="lblFail" runat="server" CssClass="Lable" ForeColor="Red" Text="Faild to Update Profile" Visible="False"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Button ID="btnEdit" runat="server" CssClass="button" Text="Edit" OnClick="btnEdit_Click" />
                    </td>
                    <td class="auto-style15">
                        <asp:Button ID="btnChangePass" runat="server" CssClass="button" Text="Change Password" OnClick="btnChangePass_Click" />
                    </td>
                    
                </tr>
            </table>
        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
