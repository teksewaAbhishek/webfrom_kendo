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
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>"
                SelectCommand="SELECT * FROM [tbl_doctor]">
            </asp:SqlDataSource>

         <telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="true"  AllowSorting="True" PageSize="10"
    DataSourceID="SqlDataSource1" OnDeleteCommand="RadGrid2_DeleteCommand" OnItemCommand="RadGrid2_ItemCommand"
    DataKeyNames="d_id">
 

                <MasterTableView DataKeyNames="d_id">
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
