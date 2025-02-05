<%@ Page Title="" Language="C#" MasterPageFile="~/editDetails.master" AutoEventWireup="true"
    CodeBehind="ChangeTheme.aspx.cs" Inherits="project.ChangeTheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cph1">
        <script type="text/javascript">
            $(function () {
                $(".themeBox").click(function () {
                    var temp = $(this).attr("id");
                    var themeName = temp.substring(1, temp.length);
                    window.location = "ChangeTheme.aspx?th=" + themeName;
                });

                $("html,body").animate({ scrollTop: 0 }, 500);
                var theme = $("#hdThemeName").val();
                $("#_" + theme)
                .append(
                    $("<div><div>")
                        .css({"width":"20%","height":"15%", "background": "url('image/checked_checkbox.png')","background-size":"100% 100%","margin":"2px" })
                        );
            });
        </script>
        <div class="table">
            <div class="row">
                <div class="col-1-4 pad-right">
                    <div id="_master" class="themeBox def">
                        <div class="themeName">
                            Default</div>
                    </div>
                </div>
                <div class="col-1-4 pad-right">
                    <div id="_RedFrost" class="themeBox red">
                        <div class="themeName">
                            RedFrost</div>
                    </div>
                </div>
                <div class="col-1-4 pad-right">
                    <div id="_MetalicBlack" class="themeBox black">
                        <div class="themeName">
                            MetalicBlack</div>
                    </div>
                </div>
                <div class="col-1-4 pad-right">
                    <div id="_android" class="themeBox green">
                        <div class="themeName">
                            Android</div>
                    </div>
                </div>
            </div>
            <div class="table">
                <div class="col-1-4 pad-right">
                    <div id="_Whitester" class="themeBox silver">
                        <div class="themeName">
                            Whitester</div>
                    </div>
                </div>
                <div class="col-1-4 pad-right">
                    <div id="_Reblee" class="themeBox Reblee">
                        <div class="themeName">
                            Reblee</div>
                    </div>
                </div>
            </div>
        </div></div>
        <input id="hdThemeName" type=hidden value="<%= theme %>" />
</asp:Content>
