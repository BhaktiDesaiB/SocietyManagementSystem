<%@ Page Title="" Language="C#" MasterPageFile="~/fmTools.master" AutoEventWireup="true"
    CodeBehind="bookingSystem.aspx.cs" Inherits="project.bookingSystem"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div class="book">
            <table class="style1">
                <tr>
                    <td align="right">
                        Purpose :
                    </td>
                    <td>
                        <asp:TextBox ID="txtpurpose" runat="server" class="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Date Of Booking :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlday" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Date</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlmonth" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Month</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlyear" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Year</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Days:
                    </td>
                    <td>
                        <asp:RadioButton class="rbt1" ID="rbt1" GroupName="rbtn" runat="server" AutoPostBack=true Text="One" OnCheckedChanged="rbtn_CheckChanged"/>
                        <asp:RadioButton class="rbt2" ID="rbt2" GroupName="rbtn" runat="server" AutoPostBack=true Text="Many" OnCheckedChanged="rbtn_CheckChanged"/>
                    </td>
                </tr>
                <%--<tr class="slot">
                    <td align="right">
                        Slots:
                    </td>
                    <td>
                        <asp:CheckBox ID="slot1" Text="7am-12pm" runat="server" />
                        <asp:CheckBox ID="slot2" Text="1pm-6pm" runat="server" />
                        <asp:CheckBox ID="slot3" Text="7pm-11pm" runat="server" />
                    </td>
                </tr>--%>
                <tr class="tillDate">
                    <td align="right" class="ddl">
                        Till :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlday1" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Date</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlmonth1" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Month</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlyear1" runat="server" class="dropdown">
                            <asp:ListItem Value="-1">Year</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="btnBook_Click" class="button"/>
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="Cancel" OnClick="btnClear_Click" class="button"/>
                    </td>
                </tr>
            </table>
        </div>
    <div class="gv1">
        <asp:GridView ID="gvbooking" runat="server" class="gv">
        </asp:GridView>
    </div>
    </div>
</asp:Content>
