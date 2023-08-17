<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getdoctors.aspx.cs" Inherits="Clinic_Mgmt.VIEWS.getdoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #GridView2 {
            width: 100%;
        }
        .action-buttons {
            display: none;
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: white; 
            border: 1px solid #ccc; 
        }
        .cell-content {
            position: relative;
        }
        .btn {
            display: block;
            width: 100%;
            text-align: right;
            margin-bottom: 5px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
          $(document).ready(function () {
              $('.cell-content').click(function (e) {
                  e.stopPropagation();
                  $('.action-buttons').hide();
                  $(this).find('.action-buttons').show();
              });

              $(document).click(function () {
                  $('.action-buttons').hide();
              });
          });

          $(document).ready(function () {
              $('.cell-content').on('mousedown', function (e) {
                  e.stopPropagation();
                  $('.action-buttons').hide();
                  $(this).find('.action-buttons').show();
              });

              $(document).on('mousedown', function () {
                  $('.action-buttons').hide();
              });
          });


          $(document).ready(function () {
              $('.cell-content').on('contextmenu', function (e) {
                  e.preventDefault();
                  $('.action-buttons').hide();
                  $(this).find('.action-buttons').show();
              });

              $(document).on('mousedown', function () {
                  $('.action-buttons').hide();
              });
          });
      </script>
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
            SelectCommand="SELECT d_id as ID, d_name as Name, d_contact as Contact, d_email as Email, d_dateofbirth as DOB FROM [tbl_doctor]">
        </asp:SqlDataSource>

        <telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="true" AllowSorting="True" PageSize="10"
            DataSourceID="SqlDataSource1" OnDeleteCommand="RadGrid2_DeleteCommand" OnItemCommand="RadGrid2_ItemCommand"
            DataKeyNames="d_id"  AutoGenerateColumns="False">
            <MasterTableView DataKeyNames="ID">
                <Columns>
                     <telerik:GridBoundColumn DataField="ID" HeaderText="ID" />
                    <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name">
                        <ItemTemplate>
                            <div class="cell-content">
                                <%# Eval("Name") %>
                                <div class="action-buttons">
                                    <telerik:RadButton ID="btnEdit1" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                                    <telerik:RadButton ID="btnDelete1" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn HeaderText="Contact" SortExpression="Contact">
     <ItemTemplate>
         <div class="cell-content">
             <%# Eval("Contact") %>
             <div class="action-buttons">
                 <telerik:RadButton ID="btnEdit2" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                 <telerik:RadButton ID="btnDelete2" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
             </div>
         </div>
     </ItemTemplate>
 </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn HeaderText="Email" SortExpression="Email">
     <ItemTemplate>
         <div class="cell-content">
             <%# Eval("Email") %>
             <div class="action-buttons">
                 <telerik:RadButton ID="btnEdit3" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                 <telerik:RadButton ID="btnDelete3" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
             </div>
         </div>
     </ItemTemplate>
 </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn HeaderText="DOB" SortExpression="DOB">
     <ItemTemplate>
         <div class="cell-content">
             <%# Eval("DOB") %>
             <div class="action-buttons">
                 <telerik:RadButton ID="btnEdit4" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                 <telerik:RadButton ID="btnDelete4" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
             </div>
         </div>
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
