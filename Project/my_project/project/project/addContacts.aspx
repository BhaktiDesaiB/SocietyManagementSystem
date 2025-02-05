<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="addContacts.aspx.cs" Inherits="project.addContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table tr td
        {
            padding: 3px;
        }
    </style>
    <div class="cph1">
        <table>
            <tr>
                <td align="right">
                    Name :
                </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" class="textbox" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right">
                    Designation :
                </td>
                <td>
                    <asp:DropDownList ID="ddldesignation" runat="server" class="dropdown">
                        <asp:ListItem Value="Designation"></asp:ListItem>
                        <asp:ListItem Value="Electrician"></asp:ListItem>
                        <asp:ListItem Value="TelePhone Exchange"></asp:ListItem>
                        <asp:ListItem Value="Doctor"></asp:ListItem>
                        <asp:ListItem Value="Carpenter"></asp:ListItem>
                        <asp:ListItem Value="Plumber"></asp:ListItem>
                        <asp:ListItem Value="Interior"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Contact :
                </td>
                <td>
                    <asp:TextBox ID="txtcontact" runat="server" class="textbox" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnsubmit" runat="server" Text="Save" CssClass="button" OnClick="btnsubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button" OnClick="btncancel_Click" />
                    &nbsp<asp:Button ID="Button1" runat="server" Text="Update" CssClass="button" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div class="gv1">
            <asp:GridView ID="gvContact" class="gv" runat="server" OnSelectedIndexChanging="gvContact_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hdContactId" runat="server" />
    </div>
</asp:Content>
