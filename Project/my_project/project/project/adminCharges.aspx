<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="adminCharges.aspx.cs" Inherits="project.adminCharges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table tr td
        {
            padding: 3px;
        }
    </style>
    <div class="cph1">
        <table class="style1">
            <tr>
                <td style="width: 187px; text-align: right">
                    Maintenance :
                </td>
                <td>
                    <asp:TextBox ID="txtmaintenancecharge" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Municipal Tax :
                </td>
                <td>
                    <asp:TextBox ID="txtmunicipalcharge" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Water Charges :
                </td>
                <td>
                    <asp:TextBox ID="txtwatercharge" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Gym Charges :
                </td>
                <td>
                    <asp:TextBox ID="txtgymcharge" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Parking Charge :
                </td>
                <td>
                    <asp:TextBox ID="txtparkingcharge" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Penalty :
                </td>
                <td>
                    <asp:TextBox ID="txtpenalty" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    Interest Rate :
                </td>
                <td>
                    <asp:TextBox ID="txtinterest" runat="server" class="textbox"/>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 187px; text-align: right">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"
                        Visible="true" class="button"/>
                    <asp:Button ID="btnupdate" runat="server" Text="Update" Visible="false" OnClick="btnupdate_Click" class="button"/>
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
        <div class="gv1">
            <asp:GridView ID="gvcharges" class="gv" runat="server" OnSelectedIndexChanging="gvcharges_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hdcharge" runat="server" />
    </div>
</asp:Content>
