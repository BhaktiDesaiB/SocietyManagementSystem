<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="forgetPassword.aspx.cs" Inherits="project.forgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div style="text-align: center">
            Forgot Password ??
        </div>
        <div style="text-align: center">
            Enter your Email-ID to recieve your Password</div>
        <br />
        <div style="text-align: center">
            <asp:TextBox ID="txtsendpass" runat="server" width="22%" class="textbox" /></div>
        <br />
        <div style="text-align: center">
            <asp:Button ID="btnreceive" runat="server" Text="Receive Password" class="button" OnClick="btnreceive_Click" /></div>
    </div>
</asp:Content>
