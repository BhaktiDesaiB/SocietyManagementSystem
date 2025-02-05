<%@ Page Title="" Language="C#" MasterPageFile="~/editDetails.master" AutoEventWireup="true"
    CodeBehind="flat.aspx.cs" Inherits="project.flat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table tr td
        {
            padding: 3px;
        }
    </style>
    <table>
        <tr>
            <td align="center" colspan="2">
                <b>Flat Details</b>
            </td>
        </tr>
        <tr>
            <td align="right">
                Flat Number :
            </td>
            <td>
                <asp:DropDownList ID="ddl1" runat="server" ToolTip="0" TabIndex="1" class="dropdown">
                    <asp:ListItem Value="-1">Wing</asp:ListItem>
                    <asp:ListItem Value="A"></asp:ListItem>
                    <asp:ListItem Value="B"></asp:ListItem>
                    <asp:ListItem Value="C"></asp:ListItem>
                    <asp:ListItem Value="D"></asp:ListItem>
                    <asp:ListItem Value="E"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt1" runat="server" MaxLength="4" TabIndex="2" class="textbox"
                onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                Share-Certif.No :
            </td>
            <td>
                <asp:TextBox ID="txt2" runat="server" MaxLength="5" TabIndex="3" class="textbox" 
                onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                No.of Vehicles :
            </td>
            <td>
                <asp:DropDownList ID="ddl2" runat="server" TabIndex="4" class="dropdown">
                    <asp:ListItem Value="-1">2-Wheeler</asp:ListItem>
                    <asp:ListItem Value="0"></asp:ListItem>
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                    <asp:ListItem Value="4"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl3" runat="server" TabIndex="5" class="dropdown">
                    <asp:ListItem Value="-1">4-Wheeeler</asp:ListItem>
                    <asp:ListItem Value="0"></asp:ListItem>
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                    <asp:ListItem Value="4"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                On Rent :
            </td>
            <td>
                <asp:DropDownList ID="ddlrent" runat="server" class="dropdown" TabIndex="6">
                    <asp:ListItem Value="-1">Rent</asp:ListItem>
                    <asp:ListItem Value="Yes"></asp:ListItem>
                    <asp:ListItem Value="No"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button runat="server" ID="btnsubmit" Text="Save" class="button" TabIndex="7"
                    OnClick="btnsubmit_Click" />
            </td>
            <td>
                <asp:Button runat="server" ID="btncancel" Text="cancel" class="button" OnClick="btncancel_Click"
                    TabIndex="8" />
            </td>
        </tr>
    </table>
</asp:Content>
