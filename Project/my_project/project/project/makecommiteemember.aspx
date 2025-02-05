<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="makecommiteemember.aspx.cs" Inherits="project.makecommiteemember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <asp:DropDownList ID="ddlmember" runat="server" class="dropdown">
            <asp:ListItem Value="-1">Type</asp:ListItem>
            <asp:ListItem>admin</asp:ListItem>
            <asp:ListItem>Member</asp:ListItem>
            <asp:ListItem>Secretary</asp:ListItem>
            <asp:ListItem>Chairman</asp:ListItem>
            <asp:ListItem>Treasurer</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnupdate" Text="Update" runat="server" CssClass="button" OnClick="btnupdate_Click" /><br /><br />
        <div class="gv1">
            <asp:GridView ID="gvCommMember" class="gv" runat="server" OnSelectedIndexChanging="gvCommMember_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hdcommember" runat="server" />
    </div>
</asp:Content>
