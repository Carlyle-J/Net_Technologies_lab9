<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="p9.Comapanies" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Companies</title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Repeater ID="rptCompanies" runat="server">
            <HeaderTemplate>
                <table border="1" cellpadding="5">
                    <tr>
                        <th>Placement ID</th>
                        <th>Student ID</th>
                        <th>Company</th>
                        <th>Job Role</th>
                        <th>Package (LPA)</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("PlacementId") %></td>
                    <td><%# Eval("StudentId") %></td>
                    <td><%# Eval("CompanyName") %></td>
                    <td><%# Eval("JobRole") %></td>
                    <td><%# Eval("PackageLPA", "{0:0.00}") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <h3>Company Details</h3>
        <asp:DataList ID="dlCompanies" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10">
            <ItemTemplate>
                <table border="1" cellpadding="6" style="width:250px;">
                    <tr><td colspan="2"><b><%# Eval("CompanyName") %></b></td></tr>
                    <tr><td>Job Role</td><td><%# Eval("JobRole") %></td></tr>
                    <tr><td>Package (LPA)</td><td><%# Eval("PackageLPA", "{0:0.00}") %></td></tr>
                </table>
            </ItemTemplate>
        </asp:DataList>

        <br />
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default.aspx">Back to Dashboard</asp:HyperLink>
    </form>
</body>
</html>
