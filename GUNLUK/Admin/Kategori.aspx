<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Kategori.aspx.cs" Inherits="GUNLUK.Admin.Kategori" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 150px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlKategoriListe" runat="server">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Kategori Adı:"></asp:Label>
                    <asp:TextBox ID="txtKategoriAra" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ara" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Yeni" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="KATEGORI_REFNO" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                            <asp:BoundField DataField="KATEGORI_REFNO" HeaderText="Kategori Refno" />
                            <asp:BoundField DataField="KATEGORI_ADI" HeaderText="Kategori Adı" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </asp:Panel>
    
    <asp:Panel ID="pnlKategoriKayit" runat="server" Visible="False">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="KATEGORİ FORMU"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Kategori Refno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtKATEGORI_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Kategori Adı"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtKATEGORI_ADI" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKATEGORI_ADI" ErrorMessage="Kategori adı giriniz." ValidationGroup="KategoriKayitForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Kaydet" ValidationGroup="KategoriKayitForm" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Vazgeç" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" OnClientClick="return confirm(&quot;Kayıt silinsin mi?&quot;)" Text="Sil" />
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>
