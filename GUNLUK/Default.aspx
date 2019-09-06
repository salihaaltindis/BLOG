<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSayfa.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GUNLUK.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="sonyazi">
        SON YAZILAR
    </div>
        
    <div class="sonyazilar">
        <asp:DataList ID="DataList1" runat="server" Width="100%"  OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <table cellspacing="0" class="auto-style1">
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/YaziDetay.aspx?yazi_refno="+Eval("YAZI_REFNO") %>' Text='<%# Eval("BASLIK") %>'></asp:HyperLink>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("OZET") %>'></asp:Label>
                        </td>
                        <td style="width: 100px; height: 150px;">
                            <asp:Image ID="Image1" runat="server" CssClass="resimyuvarla" Height="150px" ImageUrl='<%# "~/Images/"+Eval("RESIM") %>' Width="100px" />
                        </td>
                    </tr>
                </table>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <table cellspacing="0" class="auto-style1">
                    <tr>
                        <td style="width: 100px; height: 150px">
                            <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# "~/Images/"+Eval("RESIM") %>' Width="100px" CssClass="resimyuvarla" />
                        </td>
                        <td style="vertical-align: top">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/YaziDetay.aspx?yazi_refno="+Eval("YAZI_REFNO") %>' Text='<%# Eval("BASLIK") %>'></asp:HyperLink>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("OZET") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>

           
 

</asp:Content>
