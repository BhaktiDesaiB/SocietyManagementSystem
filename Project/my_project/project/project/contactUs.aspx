
<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="contactUs.aspx.cs" Inherits="project.contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 24px;
            height: 24px;
        }
    </style>
        <script type="text/javascript">
            $(function () {
                $("html,body").animate({ scrollTop: 170 }, 900);
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border">
        <div>
            <img src="~/image/contactus.jpg" alt="" runat="server" style="width:100%"/></div>
        <br />
        <div style="text-align: center;">
            Reach Out to Us
        </div>
        <div id="cntus1">
            <img src="image/service-with-smile.png" alt="" />
        </div>
        <div>
            <b>Email us : </b>
            <p>
                nikunjchayya@gmail.com</p>
            for all support related queries.<br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <strong>Our Head Office:<br />
            </strong>Kandivali
            <br />
            &nbsp;&nbsp;&nbsp; <b>Bharat Desai</b>
            <br />
            C/601 Nikunj Chhaya,
            <br />
            Mathuradas Road,
            <br />
            Near Dhanamal School,
            <br />
            Kandivli(West).Mumbai-400067.
            <br />
            <img class="style1" src="image/telephone.png" />&nbsp; 9619326053
        </div>
    </div>
</asp:Content>
