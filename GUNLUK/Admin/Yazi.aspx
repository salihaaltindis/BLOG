<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Yazi.aspx.cs" Inherits="GUNLUK.Admin.Yazi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
        .auto-style3 {
            height: 21px;
        }
        .auto-style4 {
            width: 200px;
        }
        .auto-style5 {
            width: 200px;
            height: 21px;
        }
        .auto-style6 {
            width: 200px;
            height: 42px;
        }
        .auto-style7 {
            height: 42px;
        }
    </style>
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlListe" runat="server">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Başlık"></asp:Label>
                    <asp:TextBox ID="txtYaziAra" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ara" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="YAZI_REFNO" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                            <asp:BoundField DataField="BASLIK" HeaderText="Başlık" />
                            <asp:BoundField DataField="TARIH" DataFormatString="{0:d}" HeaderText="Tarih" />
                            <asp:BoundField DataField="KATEGORI_ADI" HeaderText="Kategori Adı" />
                            <asp:BoundField DataField="OZET" HeaderText="Özet" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="pnlKayit" runat="server" Visible="False">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="YAZI FORMU"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Yazı Refno</td>
                <td>
                    <asp:TextBox ID="txtYAZI_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="Başlık"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBASLIK" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBASLIK" ErrorMessage="Başlık giriniz." ValidationGroup="kayitForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label5" runat="server" Text="İçerik"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtICERIK" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtICERIK" ErrorMessage="İçerik giriniz." ValidationGroup="kayitForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label6" runat="server" Text="Tarih"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTARIH" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTARIH" ErrorMessage="Tarih giriniz." ValidationGroup="kayitForm"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTARIH" ErrorMessage="Tarih formatı yanlış." ValidationExpression="^(([0-9])|([0-2][0-9])|(3[0-1]))\.(([1-9])|(0[1-9])|(1[0-2]))\.(([0-9][0-9])|([1-2][0,9][0-9][0-9]))$" ValidationGroup="kayitForm"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label7" runat="server" Text="Durumu"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDURUMU" runat="server" Height="16px" Width="125px">
                        <asp:ListItem Selected="True" Value="True">Aktif</asp:ListItem>
                        <asp:ListItem Value="False">Pasif</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="Kategori Refno"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlKATEGORI_REFNO" runat="server" Width="127px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label9" runat="server" Text="Tıklanma Sayısı"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTIKLANMA_SAYISI" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTIKLANMA_SAYISI" ErrorMessage="Tıklanma sayısını giriniz." ValidationGroup="kayitForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" runat="server" Text="Özet"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtOZET" runat="server" MaxLength="250"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOZET" ErrorMessage="Özet yazınız." ValidationGroup="kayitForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label11" runat="server" Text="Resim"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="fileUploadRESIM" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Kaydet" ValidationGroup="kayitForm" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Vazgeç" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Sil" OnClientClick="return confirm(&quot;Kayıt silinsin mi?&quot;)" />
                </td>
            </tr>
        </table>

    </asp:Panel>

    <script>
        var editor = CKEDITOR.replace('ContentPlaceHolder1_txtICERIK');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
