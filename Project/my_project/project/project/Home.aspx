<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="project.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sliderupper">
        INDIA'S BEST ONLINE ACCOUNTING MANAGEMENT SOFTWARE
    </div>
    <div class="slider">
        <div class="marq">
            <marquee onmouseover="this.stop();" onmouseout="this.start();" direction="left" scrollamount="6" />
            <h3>
                Our Society is an BMC certified. Society provides amenities Like SWIMMING-POOL ,
                BANQUET-HALL , GYM , CLUB-HOUSE , GARDEN AND MANY MORE
            </h3>
            </marquee>
        </div>
        <img src="image/1.jpg" alt="" class="stretched" />
        <img src="image/party hall.jpg" alt="" class="stretched" />
        <img src="image/Swimming Pool.JPG" alt="" class="stretched" />
        <img src="image/park.jpg" alt="" class="stretched" />
        <img src="image/park1.jpg" alt="" class="stretched" />
        <img src="image/gym-area.jpg" alt="" class="stretched" />
    </div>
</asp:Content>
