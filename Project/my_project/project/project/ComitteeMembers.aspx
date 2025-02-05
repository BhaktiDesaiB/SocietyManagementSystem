<%@ Page Title="" Language="C#" MasterPageFile="~/sdManagement.master" AutoEventWireup="true"
    CodeBehind="ComitteeMembers.aspx.cs" Inherits="project.ComitteeMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div class="gv1">
            <asp:GridView ID="gvCommitteMember" runat="server" class="gv">
            </asp:GridView>
        </div>
    </div>
</asp:Content>
