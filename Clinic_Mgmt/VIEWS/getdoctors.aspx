<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getdoctors.aspx.cs" Inherits="Clinic_Mgmt.VIEWS.getdoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #GridView2 {
            width: 100%;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1"></telerik:RadScriptManager>
            <!-- Search Bar -->
    <div>
       <asp:TextBox ID="txtSearch" runat="server" placeholder="Search..."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </div>

    <!-- RadGrid -->
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>"
                SelectCommand="SELECT d_id as ID, d_name as Name,d_contact as Contact, d_email as Email, d_dateofbirth as DOB FROM [tbl_doctor]">
            </asp:SqlDataSource>

         <telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="true"  AllowSorting="True" PageSize="10"
    DataSourceID="SqlDataSource1" OnDeleteCommand="RadGrid2_DeleteCommand" OnItemCommand="RadGrid2_ItemCommand"
    DataKeyNames="d_id">
 

                <MasterTableView DataKeyNames="ID">
                    <Columns>
                      
                        <telerik:GridTemplateColumn HeaderText="Actions">
                            <ItemTemplate>
                                <telerik:RadButton ID="btnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                                <telerik:RadButton ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
                <PagerStyle AlwaysVisible="true" />
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
