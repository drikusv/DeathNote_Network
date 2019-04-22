<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendRequest.aspx.cs" Inherits="DeathNote_Site.Forms.FriendRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>

        </header>
        <div>
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                    <asp:Button ID="Button2" runat="server" Text="Button" />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <footer>

        </footer>
    </form>
</body>
</html>
