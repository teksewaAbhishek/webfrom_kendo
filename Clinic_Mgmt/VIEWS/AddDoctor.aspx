
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="Clinic_Mgmt.VIEWS.AddDoctor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
  
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1"></telerik:RadScriptManager>
         
        
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                <td>
                    <telerik:RadTextBox ID="txtname" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Contact"></asp:Label></td>
                <td>
                    <telerik:RadTextBox ID="txtcontact" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label></td>
                <td>
                    <telerik:RadTextBox ID="txtemail" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Date of birth"></asp:Label></td>
                <td>
                    <telerik:RadDatePicker ID="dob" runat="server"></telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td colspan="2"> 
                    <telerik:RadButton ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ></telerik:RadButton>
                </td>
            </tr>
        </table>
      
    </form>
</body>
</html>