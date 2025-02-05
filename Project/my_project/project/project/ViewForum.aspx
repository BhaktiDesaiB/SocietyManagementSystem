<%@ Page Title="" Language="C#" MasterPageFile="~/helpdesk.master" AutoEventWireup="true" CodeBehind="ViewForum.aspx.cs" Inherits="project.compalinBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    $(function () {

        var temp = window.location;
        var fid = "fid0001";
        if(temp.href.indexOf("?")!=-1)
        {
            var getParam = temp.href.split("?");
            var data = getParam[1].split("=");
            var fid = data[1];
         }

        $.ajax({
            type: "POST",
            contentType: "application/json;charset=utf-8",
            url: "Service.asmx/getThreads",
            data: JSON.stringify({ ForumId: fid }),
            dataType: "json",
            success: function (data) {
                $.each(data.d, function (i, obj) {
                    $("#threadContent")
                            .append(
                                $("<div></div>").addClass("row threadStyle")
                                    .append(
                                        $("<div></div>").addClass("row large").html(obj.Content)
                                    )
                                    .append(
                                        $("<div></div>").addClass("row")
                                            .append(
                                                $("<div></div>").addClass("col-3-4 small").html("Post By " + obj.By)
                                            )
                                            .append(
                                                $("<div></div>").addClass("col-1-4 small").html("On " + obj.CreatedOn)
                                            )
                                    )
                            );
                });
            },
            error: function (result) { alert(result.responseText); }
        });
    });
</script>
    <div class="thread">
        <div id="forumContent" class="row threadTitle">
        <div class="row">            
                <div class="row largeF" id="forumTitle" runat="server">
                </div>
                <div class="row">
                    <div class="col-3-4 smallF" id="forumBy" runat="server"></div>
                    <div class="col-1-4 smallF" id="forumOn" runat="server"></div>
                </div>
            </div>
        </div>
        <div id="threadContent" class="threadContent">
        </div>
        <div class="row">
            <div class="col-3-4 padRight">
                <asp:TextBox ID="txtPost" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="10" style="resize:none;width:100%;"></asp:TextBox>                
            </div>
            <div class="col-1-4">
                <asp:Button ID="btnPost" runat="server" CssClass="button" Text="Post" 
                    onclick="btnPost_Click" OnClientClick="return  check()" style="width:100%"/>
            </div>
        </div>

    </div>
</asp:Content>
