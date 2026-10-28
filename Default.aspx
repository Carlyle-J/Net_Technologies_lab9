<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="p9.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Placement Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Student Placement Dashboard</h2>
        <hr />

        <h3>Placement Summary</h3>
<table border="1" cellpadding="8">
    <tr>
        <td>Total Students</td>
        <td>
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Placed Students</td>
        <td>
            <asp:Label ID="lblPlaced" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Unplaced Students</td>
        <td>
            <asp:Label ID="lblUnplaced" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Placement Percentage</td>
        <td>
            <asp:Label ID="lblPercentage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Highest Package(LPA)</td>
        <td>
            <asp:Label ID="lblHighestPackage" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<h3>Student Placement Records</h3>
<asp:GridView ID="gvPlacements" runat="server" AutoGenerateColumns="true" CellPadding="3">
</asp:GridView>

<br />
<asp:HyperLink ID="lnkCompanies" runat="server" NavigateUrl="~/Companies.aspx">View Companies</asp:HyperLink>

 </form>
    
</body>
</html>
