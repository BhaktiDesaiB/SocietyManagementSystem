<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintBill.aspx.cs" Inherits="project.PrintBill" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="txtBillno" /><asp:Button runat="server" ID="btnShow"
            OnClick="btnShow_Click" />
    </div>
    <div>
        <CR:CrystalReportViewer ID="rpt" runat="server" AutoDataBind="true" Visible="false" />
    </div>
    </form>
</body>
</html>
