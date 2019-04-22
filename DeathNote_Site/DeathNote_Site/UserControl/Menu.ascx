<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="DeathNote_Site.UserControl.Menu" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
        height: 231px;
    }
    .auto-style2 {
        height: 101px;
        text-align: center;
    }
    .auto-style4 {
        font-size: larger;
    }
    .auto-style5 {
        height: 52px;
        width: 222px;
    }
    .auto-style6 {
        height: 52px;
        width: 231px;
    }
    .auto-style7 {
        height: 52px;
        width: 222px;
        text-align: center;
    }
    .auto-style8 {
        height: 52px;
        width: 231px;
        text-align: center;
    }
    .auto-style9 {
        height: 52px;
        width: 222px;
        text-align: right;
    }
</style>
<table class="auto-style1" style="background-color: #000066; color: #FFFFFF;">
    <tr>
        <td class="auto-style2" colspan="8">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style4" Font-Names="Chiller" Font-Size="60pt" Text="DeathNote"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style6"></td>
    </tr>
    <tr>
         <td class="auto-style5"></td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style7">
            <asp:Button ID="btnProfile" runat="server" BorderColor="#999999" BorderStyle="None" ForeColor="Gray" Height="47px" OnClick="btnProfile_Click" Text="Profile" Width="210px" />
         </td>
        <td class="auto-style7">
            <asp:Button ID="btnFriends" runat="server" BorderStyle="None" ForeColor="Gray" Height="47px" OnClick="btnFriends_Click" Text="Friends" Width="210px" />
         </td>
        <td class="auto-style5"></td>
        <td class="auto-style9">
            <asp:Label ID="lblLogin" runat="server" Text="Label"></asp:Label>
         </td>
        <td class="auto-style8">
            <asp:Button ID="btnLogout" runat="server" BorderStyle="None" Height="47px" OnClick="btnLogout_Click" Text="Logout" Width="100px" />
         </td>
    </tr>

</table>


