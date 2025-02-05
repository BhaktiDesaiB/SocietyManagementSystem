<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="AdminMaintenance.aspx.cs" Inherits="project.AdminMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">







        <table class="col-1-2">
            <tr>
                <td align="right">
                    bill Id :
                </td>
                <td>
                    <asp:TextBox ID="txtid" runat="server" class="textbox" ReadOnly="True"/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Maintenance :
                </td>
                <td>
                    <asp:TextBox ID="txtmaintenance" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Municipal Tax :
                </td>
                <td>
                    <asp:TextBox ID="txtmunicipal" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Water charges :
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Gym charges :
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Parking charges :
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Miscellaneous :
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Total :
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" class="textbox" />
                </td>
            </tr>
        </table>
        <table class="col-1-2">
            <tr>
                <td align="right">
                    Amount Due :
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Interest :
                </td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Discount :
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Total Amount :
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Bill Month :
                </td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Bill Year :
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" class="textbox" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Bill Paid :
                </td>
                <td>
                    <asp:DropDownList ID="ddlpaid" runat="server" class="dropdown">
                        <asp:ListItem Value="-1">Paid</asp:ListItem>
                        <asp:ListItem Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnUpdate_Click" />
                </td>
            </tr>
        </table>
        <div class="myTable">
            <div class="row">
                <div class="col-1-3">
                    <asp:DropDownList runat="server" ID="ddlBillMonth" CssClass="dropdown">
                        <asp:ListItem Text="Select Month" />
                    </asp:DropDownList>
                </div>
                <div class="col-1-3">
                    <asp:TextBox runat="server" ID="txtBillYear" CssClass="textbox" Placeholder="Year"/>
                </div>
                <div class="col-1-3">
                    <asp:Button Text="Genrate Bill Details" runat="server" ID="btnGenerateBill" CssClass="button"
                        OnClick="btnGenerateBill_Click" />
                </div>
            </div>
        </div>
        <div class="myTable">
                <div class="row">
                    <div class="col-1-3">
                        <asp:DropDownList runat="server" ID="ddlMonth" CssClass="dropdown">
                            <asp:ListItem Text="Select Month" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-1-3">
                        <asp:TextBox runat="server" ID="txtYear" CssClass="textbox" Placeholder="Year"/>
                    </div>
                    <div class="col-1-3">
                        <asp:Button Text="Show Bill For" runat="server" ID="btnBill" CssClass="button" OnClick="btnBill_Click"  />
                    </div>
                </div>
            </div>
              



        <div class="gv1">
            <asp:GridView ID="gvBill" runat="server" AutoGenerateSelectButton="True" class="gv"
                OnSelectedIndexChanging="gvBill_SelectedIndexChanging">
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hdbill" runat="server" />
    </div>
</asp:Content>
