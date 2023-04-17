<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allArtists.aspx.cs" Inherits="views_artists_artists" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=8" />
</head>
<body>
    <main class="discovery--section">
        <h1>All artists</h1>
        <h2>Please select an artist to view their details.</h2>
        <section class="discovery--artists-section">
            <div class="discovery--grid-holder">
                <div class="ly-grid ly-grid-cranberries">
                    <asp:Repeater runat="server" ID="artistsRepeater">
                        <ItemTemplate>
                            <div class="creator-item">
                                <a class="creator-item--img--link" href="../artistDetails/artistDetails.aspx?idArt=<%#Eval("artistID") %>">
                                    <img class="creator-item--img" alt="<%#Eval("Title") %>" src="<%#Eval("imageURL") %>" srcset="<%#Eval("imageURL") %>, <%#Eval("imageURL") %> 2x">
                                </a>
                                <div class="creator-item--info">
                                    <a class="creator-item--title" href="../artistDetails/artistDetails.aspx?idArt=<%#Eval("artistID") %>"><%#Eval("Title") %></a><a class="creator-item--subtitle" href="../artistDetails/artistDetails.aspx?idArt=<%#Eval("artistID") %>"><%#Eval("albumCount") %></a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
