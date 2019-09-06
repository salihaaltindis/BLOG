<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Yorum.aspx.cs" Inherits="GUNLUK.Admin.Yorum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 184px;
        }
        .auto-style3 {
            width: 184px;
            height: 28px;
        }
        .auto-style4 {
            height: 28px;
        }
    </style>

    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlYorumListele" runat="server">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="İçerik:"></asp:Label>
                    <asp:TextBox ID="txtYorumAra" runat="server"></asp:TextBox>
                    <asp:Button ID="btnYorumAra" runat="server" OnClick="btnYorumAra_Click" Text="Ara" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="YORUM_REFNO" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" Width="100%">
                        <Columns>
                            <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                            <asp:BoundField DataField="MAIL" HeaderText="Mail" />
                            <asp:BoundField DataField="TARIH" HeaderText="Tarih" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="ICERIK" HeaderText="Içerik" />
                            <asp:BoundField DataField="ADI_SOYADI" HeaderText="Adı Soyadı" />
                            <asp:BoundField DataField="BASLIK" HeaderText="Başlık" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlYorumKayit" Visible="False">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="YORUM FORMU"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Yorum Refno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtYORUM_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Yazı Refno"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlYAZI_REFNO" runat="server" Width="125px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Mail"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMAIL" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMAIL" ErrorMessage="Mail adresi giriniz." ValidationGroup="YorumKayıtForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Durumu"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDURUMU" runat="server" Height="16px" Width="93px">
                        <asp:ListItem Selected="True" Value="True">Aktif</asp:ListItem>
                        <asp:ListItem Value="False">Pasif</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Tarih"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTARIH" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTARIH" ErrorMessage="Tarih bilgisi giriniz." ValidationGroup="YorumKayıtForm"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTARIH" ErrorMessage="Tarih formatı yanlış" ValidationExpression="^(([0-9])|([0-2][0-9])|(3[0-1]))\.(([1-9])|(0[1-9])|(1[0-2]))\.(([0-9][0-9])|([1-2][0,9][0-9][0-9]))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="IP"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtIP" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIP" ErrorMessage="IP bilgisi giriniz." ValidationGroup="YorumKayıtForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label9" runat="server" Text="İçerik"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtICERIK" runat="server" MaxLength="150" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtICERIK" ErrorMessage="İçerik ekleyiniz." ValidationGroup="YorumKayıtForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label10" runat="server" Text="Adı Soyadı"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtADI_SOYADI" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtADI_SOYADI" ErrorMessage="Ad soyad ekleyiniz." ValidationGroup="YorumKayıtForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Kaydet" ValidationGroup="YorumKayıtForm" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Vazgeç" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" OnClientClick="return confirm(&quot;Kayıt silinsin mi?&quot;)" Text="Sil" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <script>
        var editor = CKEDITOR.replace('ContentPlaceHolder1_txtICERIK');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
