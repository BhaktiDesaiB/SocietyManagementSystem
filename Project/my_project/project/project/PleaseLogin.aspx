<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="PleaseLogin.aspx.cs" Inherits="project.PleaseLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            var i = 5;
            setInterval(function () {
                if (i > 0) {
                    $("#loginMessage").html("Please Login!!!<br>You will be Redirected To Home Page in " + i + " Sec.");
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
    <div id="loginMessage">
    </div>
</asp:Content>
