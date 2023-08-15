<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="Clinic_Mgmt.VIEWS.update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1"></telerik:RadScriptManager>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="ID"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="TXTID" runat="server" ReadOnly="true"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtname" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Contact"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtcontact" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtemail" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Date of birth"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="TXTDOB" runat="server" ReadOnly="True"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadButton ID="Button1" runat="server" Text="Check!" CssClass="" OnClick="Button1_Click" />
                        <telerik:RadButton ID="Button2" runat="server" Text="Save!" CssClass="" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
