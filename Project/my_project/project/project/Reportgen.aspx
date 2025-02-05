<%@ Page Title="" Language="C#" MasterPageFile="~/Reports.master" AutoEventWireup="true" CodeBehind="Reportgen.aspx.cs" Inherits="project.Reportgen" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="cph2">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
        AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1269px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="1082px" ToolPanelView="None" HasPageNavigationButtons="False" HasSearchButton="False" HasZoomFactorList="False" HasGotoPageButton="False" HasCrystalLogo="False" HasExportButton="False" HasDrillUpButton="False" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Bill.rpt">
        </Report>
    </CR:CrystalReportSource>
</div>
   <script type="text/javascript">
       $(function () {
           $("#ContentPlaceHolder1_ContentPlaceHolder1_CrystalReportViewer1__UI").css({ "width": "100%" });

           var temp = $(".pePromptButton");
           var pTemp = $(temp).prev();
           var nTemp = $(temp).next();
           $(pTemp).remove();
           $(nTemp).remove();

       });
   </script>
</asp:Content>
