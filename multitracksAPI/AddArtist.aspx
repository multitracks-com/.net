<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddArtist.aspx.cs" Inherits="multitracksAPI.AddArtist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="col-lg-12">
        <br /><br />
    <table>
        <tr>
            <td>
                Band Name
            </td>
            <td>
                <asp:TextBox class="form-control form-control-lg" runat="server" ID="tbxTitle" />
            </td>
        </tr>
        <tr>
            <td>
                Biography - Something about the band
            </td>
            <td>
                <asp:TextBox class="form-control form-control-lg" TextMode="multiline" runat="server" ID="tbxBio" />
            </td>
        </tr>
        <tr>
            <td>
                ImageURL - Profile image, Add URL for a smaller or more focused image
            </td>
            <td>
                <asp:TextBox class="form-control form-control-lg" runat="server" ID="tbxImageURL" />
            </td>
        </tr>
        <tr>
            <td>
                HeroURL - Banner image, Add URL for a large image
            </td>
            <td>
                <asp:TextBox class="form-control form-control-lg" runat="server" ID="tbxHeroURL" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="" ID="lblResp" runat="server" />
            </td>
            <td>
                <asp:Button class="form-control form-control-lg" Text="Save" runat="server" ID="btnSave" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
    <br />
    </div>
    </form>
</body>
</html>

