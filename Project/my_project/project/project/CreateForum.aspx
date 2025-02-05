<%@ Page Title="" Language="C#" MasterPageFile="~/helpdesk.master" AutoEventWireup="true"
    CodeBehind="CreateForum.aspx.cs" Inherits="project.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="myTable pad">
        <div class="row">
            <div class="col-1-4 center">
                Start Forum With :</div>
            <div class="col-3-4">
                <div class="col-3-4 padRight">
                    <asp:TextBox ID="txtForumText" runat="server" class="textbox" style="width:100%"></asp:TextBox></div>
                <div class="col-1-4">
                    <asp:Button ID="btnSubmit" runat="server" class="button" Text="Create Forum" OnClick="btnSubmit_Click"
                        OnClientClick="return check();" /></div>
            </div>
        </div>
        <div class="row">
            <asp:GridView ID="gvForum" runat="server" CssClass="test">
                <Columns>
                    <asp:HyperLinkField HeaderText="Forum Link" NavigateUrl="~/ViewForum.aspx" Text="View Forum"
                        ControlStyle-CssClass="temp" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
