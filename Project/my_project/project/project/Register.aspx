<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="project.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 175px;
            text-align: right;
        }
        .style3
        {
            width: 252px;
        }
        table tr td
        {
            padding: 3px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("html,body").animate({ scrollTop: 200 }, 700);

        });

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border">
        <table class="style1">
            <tr>
                <td colspan="3">
                    <b style="margin-left: 40%;">Create an account</b>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p style="margin-left: 30%;">
                        Your Account gives you a complete access to our website.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="position: absolute; width: 22%; border: 3px groove grey; margin-left: 30%;
                        top: 25%; height: 32px; padding: 3px; text-align: center">
                        Indicates Required Field - *
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="height: 40px">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    First Name :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtfname" runat="server" Width="180px" CssClass="textbox" TabIndex="1"
                        onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfi1" runat="server" ErrorMessage="*" ControlToValidate="txtfname" />
                    <asp:RegularExpressionValidator ID="regex1" runat="server" ErrorMessage="Enter Proper First-Name"
                        ControlToValidate="txtfname" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtlname" runat="server" TabIndex="2" Width="180px" CssClass="textbox"
                        onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfi2" runat="server" ErrorMessage="*"
                        ControlToValidate="txtlname" />
                    <asp:RegularExpressionValidator ID="regex2" runat="server" ErrorMessage="Enter Proper Last-Name"
                        ControlToValidate="txtlname" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Email-ID :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtemail" runat="server" TabIndex="3" Width="180px" CssClass="textbox"
                        onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                <asp:RequiredFieldValidator ID="reqfi3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtemail" />
                    <asp:RegularExpressionValidator ID="re1" ControlToValidate="txtemail" runat="server"
                        ErrorMessage="Enter Valid Email-Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Password :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" TabIndex="4" Width="180px"
                        CssClass="textbox" onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                <asp:RequiredFieldValidator ID="reqfi4" runat="server" ErrorMessage="*"
                        ControlToValidate="txtpass" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Re-Type Password :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" TabIndex="5" Width="180px"
                        CssClass="textbox" onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';" />
                </td>
                <td>
                <asp:RequiredFieldValidator ID="reqfi5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtrepass" />
                    <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="txtrepass" ControlToCompare="txtpass"
                        ErrorMessage="Password does not match" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Birthday :
                </td>
                <td class="style3">
                    <asp:DropDownList ID="ddlday" runat="server" TabIndex="6" CssClass="dropdown">
                        <asp:ListItem Value="-1">Date</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlmonth" runat="server" TabIndex="7" CssClass="dropdown">
                        <asp:ListItem Value="-1">Month</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlyear" runat="server" TabIndex="8" CssClass="dropdown">
                        <asp:ListItem Value="-1">Year</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Gender :
                </td>
                <td class="style3">
                    <asp:RadioButton ID="rbtnMale" runat="server" GroupName="Gender" Text="Male" Checked="true"
                        TabIndex="9" class="radio" />
                    <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="Gender" Text="Female"
                        TabIndex="10" class="radio" />
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Mobile No. :
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtmobile" runat="server" TabIndex="11" Width="180px" CssClass="textbox"
                        onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';"
                        MaxLength="10" />
                </td>
                <td>
                <asp:RequiredFieldValidator ID="reqfi6" runat="server" ErrorMessage="*"
                        ControlToValidate="txtmobile" />
                    <asp:RegularExpressionValidator ID="regex3" runat="server" ErrorMessage="Enter Proper Mobile-No."
                        ControlToValidate="txtmobile" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Landline No .
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtlandline" runat="server" TabIndex="12" Width="180px" CssClass="textbox"
                        onkeyup="if(this.value=='')this.style.backgroundColor='rgba(0,0,0,0.2)';else this.style.backgroundColor='white';"
                        MaxLength="10" />
                </td>
                <td>
                <asp:RequiredFieldValidator ID="refi7" runat="server" ErrorMessage="*"
                        ControlToValidate="txtlandline" />
                    <asp:RegularExpressionValidator ID="regex4" runat="server" ErrorMessage="Enter Proper Landline-No."
                        ControlToValidate="txtlandline" ValidationExpression="^\d{5,8}$" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    User Type.&nbsp; :
                </td>
                <td class="style3">
                    <asp:DropDownList ID="ddlusertype" runat="server" TabIndex="13" CssClass="dropdown">
                        <asp:ListItem Value="Type"></asp:ListItem>
                        <asp:ListItem Value="Member"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;
                </td>
                <td class="style3">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" Text="Submit" TabIndex="14" CssClass="button"
                        OnClick="Button1_Click" />
                </td>
                <td class="style3">
                    <asp:Button ID="Button2" runat="server" Text="Cancel" TabIndex="15" CssClass="button"
                        OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
