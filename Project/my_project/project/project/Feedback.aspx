<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="Feedback.aspx.cs" Inherits="project.Feedback1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 216px;
            text-align: right;
        }
        .style4
        {
            width: 353px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <div style="text-align: center">
            <b>Please Provide your Feedback</b></div>
        <div style="text-align: center">
            Your feedback is important to us. Please Let us know about any type of abusing your
            contact will be hidden and protected.</div>
        <div style="height: 20px">
        </div>
        <div style="width: 22%; border: 3px groove grey; padding: 3px; text-align: center;
            position: absolute; left: 40%">
            Indicates Required Field - *
        </div>
        <div style="height: 40px">
        </div>
        <table class="style1">
            <tr>
                <td class="style3">
                    Full Name :
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtfeedbackname" runat="server" class="textbox" onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfi1" runat="server" ErrorMessage="*" ControlToValidate="txtfeedbackname" />
                    <asp:RegularExpressionValidator ID="regex1" runat="server" ErrorMessage="Enter Proper Name"
                        ControlToValidate="txtfeedbackname" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    E-mail :
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtfeedbackemail" runat="server" class="textbox" onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfi2" runat="server" ErrorMessage="*" ControlToValidate="txtfeedbackemail" />
                    <asp:RegularExpressionValidator ID="regex2" ControlToValidate="txtfeedbackemail"
                        runat="server" ErrorMessage="Enter Valid Email-Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Your Feedback :
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtfeedback" runat="server" class="textbox" Height="82px" TextMode="MultiLine"
                        Width="402px" Style="resize: none" onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfi3" runat="server" ErrorMessage="*" ControlToValidate="txtfeedback" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="btnsubmitfeedback" runat="server" Text="Submit" class="button" OnClick="btnsubmitfeedback_Click" />
                </td>
                <td class="style4">
                    <asp:Button ID="btncancelfeedback" runat="server" Text="Cancel" class="button" OnClick="btncancelfeedback_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
