<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Chatting.Master" CodeBehind="Default.aspx.cs" Inherits="project.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>--%>
    <script src="jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="Helper.js"></script>
    <script type ="text/javascript">
        var btnAddUser = $("#btnAddUser");
        var txtName = $("#txtName");

        function AddUser() {
            var chatService = new ServiceCall("AddUser",
                "{'userName':'" + $("#txtName").val() + "'}");
            chatService.callService(addUser_Complete);
        }

        function addUser_Complete() {
            window.open("ChatPage.aspx", "_self");
        }      
    </script>

    
<div class="cph1">

            <div>
        <h3>Enter your name:</h3>        
        <input type="text" id = "txtName" name="txtName" size = "30" class="textbox"/>&nbsp;
        <input type = "button" id = "btnAddUser" class="button" value = "Add" onclick = "AddUser();" />
    </div>    
</div>
</asp:Content>    
  