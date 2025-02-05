<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PleaseLoginadmin.aspx.cs" Inherits="project.PleaseLoginadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            var i = 10;
            setInterval(function () {
                if (i > 0) {
                    $("#loginMessage1").html("You are not an Admin.<br>Next time you attempt to try this Your ID will be Blocked and you will be solely responsible for it.!!!<br>You will be Redirected To Home Page in " + i + " Sec.");
                }
                else {
                    window.location = "Home.aspx";
                }
                i--;
            }, 1000);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loginMessage1">
    </div>
</asp:Content>
