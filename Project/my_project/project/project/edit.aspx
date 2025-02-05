<%@ Page Title="" Language="C#" MasterPageFile="~/editDetails.master" AutoEventWireup="true"
    CodeBehind="edit.aspx.cs" Inherits="project.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table tr td
        {
            padding: 5px;
        }
    </style>
    <table>
        <tr>
            <td align="center" colspan="2">
                <b>User Detail</b>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Enter Name:
            </td>
            <td>
                <asp:TextBox ID="txt1" runat="server" Width="90%" TabIndex="1" class="textbox"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Nominee Name:
            </td>
            <td>
                <asp:TextBox ID="txt2" runat="server" TabIndex="2" Width="90%" class="textbox"  
                onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Date Of Birth:
            </td>
            <td>
                <asp:DropDownList ID="ddlday" runat="server" TabIndex="3" class="dropdown">
                    <asp:ListItem Value="-1">Date</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlmonth" runat="server" TabIndex="4" class="dropdown">
                    <asp:ListItem Value="-1">Month</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlyear" runat="server" TabIndex="5" class="dropdown">
                    <asp:ListItem Value="-1">Year</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Family Members:
            </td>
            <td>
                <asp:DropDownList ID="ddlmember" runat="server" class="dropdown" TabIndex="6">
                    <asp:ListItem Value="-1">No.Of Members</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btnsubmit" Text="submit" class="button" TabIndex="7"
                    OnClick="btnsubmit_Click" />
            </td>
            <td>
                <asp:Button runat="server" ID="btncancel" Text="cancel" class="button" OnClick="btncancel_Click"
                    TabIndex="8" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
