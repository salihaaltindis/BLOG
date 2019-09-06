<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="GUNLUK.Giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            width: 115px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="0" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Giriş Ekranı"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKULLANICIADI" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPAROLA" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş Yap" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
