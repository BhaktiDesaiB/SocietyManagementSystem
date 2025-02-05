<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="adminnoticeBoard.aspx.cs" Inherits="project.adminnoticeBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div>
            <asp:TextBox ID="txtNotice" runat="server" TextMode="MultiLine" Height="213px" Width="82%"
                Wrap="False" Style="resize: none;" class="textbox"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:DropDownList ID="ddlDay" runat="server" class="dropdown">
                <asp:ListItem Value="-1">Date</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlMonth" runat="server" class="dropdown">
                <asp:ListItem Value="-1">Month</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlYear" runat="server" class="dropdown">
                <asp:ListItem Value="-1">Year</asp:ListItem>
            </asp:DropDownList>&nbsp&nbsp
            <asp:Button ID="btnsubmit" runat="server" Text="Post" CssClass="button" OnClick="btnsubmit_Click" />
            <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="button" OnClick="btnupdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="button" OnClick="btndelete_Click" />
         </div>
        <br /><br />
        <div class="gv1">
            <asp:GridView ID="gvnotice" class="gv" runat="server" OnSelectedIndexChanging="gvnotice_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField ID="hdNoticeId" runat="server" />
    </div>
</asp:Content>
