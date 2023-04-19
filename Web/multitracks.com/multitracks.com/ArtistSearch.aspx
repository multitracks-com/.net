<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArtistSearch.aspx.cs" Inherits="ArtistSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox runat="server" ID="tbxArtist" placeholder="Artist ID" />
            <asp:Button Text="GO" runat="server" ID="btnSearch" OnClick="btnSearch_Click" />
        </div>
    </form>
</body>
</html>
