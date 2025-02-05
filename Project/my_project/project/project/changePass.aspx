<%@ Page Title="" Language="C#" MasterPageFile="~/editDetails.master" AutoEventWireup="true"
    CodeBehind="changePass.aspx.cs" Inherits="project.changePass" %>



   

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    $(function () {
        $("#ContentPlaceHolder1_ContentPlaceHolder1_ChangePassword1_ChangePasswordContainerID_CurrentPassword").addClass("textbox");
        $("#ContentPlaceHolder1_ContentPlaceHolder1_ChangePassword1_ChangePasswordContainerID_NewPassword").addClass("textbox");
        $("#ContentPlaceHolder1_ContentPlaceHolder1_ChangePassword1_ChangePasswordContainerID_ConfirmNewPassword").addClass("textbox");
        $("#ContentPlaceHolder1_ContentPlaceHolder1_ChangePassword1_ChangePasswordContainerID_ChangePasswordPushButton").addClass("button");
        $("#ContentPlaceHolder1_ContentPlaceHolder1_ChangePassword1_ChangePasswordContainerID_CancelPushButton").addClass("button");
    });


</script>

    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        onchangingpassword="ChangePassword1_ChangingPassword">
    </asp:ChangePassword>
</asp:Content>
