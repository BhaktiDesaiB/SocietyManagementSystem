<%@ Page Title="" Language="C#" MasterPageFile="~/adminPanel.master" AutoEventWireup="true"
    CodeBehind="adminBackup.aspx.cs" Inherits="project.adminBackup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div><asp:Button ID="btnbackup" runat="server" Text="Backup" OnClick="btnbackup_Click" class="button" /></div>
        <br />
        <div style="padding: 10px; width: 55%;">
            <asp:FileUpload ID="fupload" runat="server"/>
            <asp:Button ID="btnrestore" runat="server" Text="Restore" OnClick="btnrestore_Click" class="button"/></div>
    </div>
</asp:Content>
