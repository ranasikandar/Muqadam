<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Muqadam.AdminPanel.Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Muqadam | AdminPanel | Product</title>
     
     <%--official bootstrap--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--%>

    <%--local bootstrap no use--%>
    <%--<link rel=Stylesheet href="bootstrap_4_0/css/bootstrap.min.css" type="text/css" />
    <script src="bootstrap_4_0/js/bootstrap.min.js"></script>
    <script src="../bootstrap_4_0/js/jquery-3.3.1.min.js"></script>--%>



    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
    <!-- Our Custom CSS -->
    <link href="../css/CpanelNavBootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">







<style type="text/css">

#cbxCompany_cbxCompany_Table
{
    top:1px !important;
    width: 100% !important;
}

#cbxCompany_cbxCompany_Table tbody tr td
{
    width: 100% !important;
}


</style>












</head>

<body>
    <form id="form1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Admin Panel</h3>
            </div>

            <ul class="list-unstyled components">
                <p>Product</p>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="Users.aspx">Users</a>
                        </li>
                        <li>
                            <a href="Company.aspx">Company</a>
                        </li>
                        <li class="active">
                            <a href="#">Product</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Menu 1</a>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="https://www.google.com/" class="download">Website</a>
                </li>
                <li>
                    <a href="Login.aspx?LogOut=1" class="article">LogOut</a>
                </li>
            </ul>
        </nav>

        <!-- Page Content Holder -->
        <div id="content">
                        
            <%--      HERE WE GO       --%>

            <div class="container">

                <button type="button" id="sidebarCollapse" class="navbar-btn">
                    <span></span><span></span><span></span>
                </button>

                <%--<div class="alert alert-warning">--%>
                <%--<asp:Label ID="lblMsg" runat="server" class="alert alert-warning" />--%>
                <%--</div>--%>

                <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <asp:Label ID="lblMsg" runat="server" class="alert alert-warning" />
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>





                <div class="row">

                    <div class="col-lg-6" style="margin-bottom:20px;">
                        <div class="card">
                            <h3 class="card-header primary-color white-text">
                                Enter Product</h3>
                            <div class="card-body">
                                
                                <div>
                                    <label class="control-label">ID</label>
                                    <asp:TextBox ID="txtID" runat="server" class="form-control" ReadOnly="true" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtID"
                                        Display="None" ErrorMessage="Please Enter ID!" SetFocusOnError="true" ToolTip="Please Enter ID!"
                                        ValidationGroup="PostNewsEvent" />
                                </div>

                                <div>
                                    <label class="control-label">Product Name<span class="star"> *</span> </label>
                                    <asp:TextBox ID="txtProductName" runat="server" class="form-control" MaxLength="50" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName"
                                        Display="None" ErrorMessage="Please Enter Product Name!" SetFocusOnError="true" ToolTip="Please Enter Product Name!"
                                        ValidationGroup="PostNewsEvent" />
                                </div>

                                <div>
                                    <label class="control-label">Current Stock<span class="star"> *</span> </label>
                                    <asp:TextBox ID="txtCurrentStock" runat="server" class="form-control" MaxLength="5"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCurrentStock"
                                        Display="None" ErrorMessage="Please Enter Full User Name!" SetFocusOnError="true" ToolTip="Please Enter User Name!"
                                        ValidationGroup="PostNewsEvent" />

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtCurrentStock"
                                        runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>

                                </div>

                                <div>
                                    <label class="control-label">Company<span class="star"> *</span> </label>
                                    <%--<asp:TextBox ID="txtCompany" runat="server" class="form-control" MaxLength="50" />--%>

                                    <ajaxToolkit:ComboBox ID="cbxCompany" runat="server" AutoCompleteMode="SuggestAppend"
                                        DataTextField="CompanyName" DataValueField="CompanyID"
                                        DropDownStyle="DropDown" MaxLength="50" class="form-control" EnableTheming="true" Width="100%" >
                                    </ajaxToolkit:ComboBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cbxCompany"
                                        Display="None" ErrorMessage="Please Select Company!" SetFocusOnError="true" ToolTip="Please Select Company!"
                                        ValidationGroup="PostNewsEvent" />
                                </div>
                                
                                
                                <div style="margin-top: 15px; margin-bottom: 10px;">
                                    <asp:Button ID="btnPost" runat="server" Text="Save Data" OnClick="btnPost_Click"
                                        ValidationGroup="PostNewsEvent" CssClass="btn btn-info" />
                                    <asp:Button ID="btnPostCancel" runat="server" Text="Cancel" OnClick="btnPostCancel_Click"
                                        class="btn btn-default" Style="margin: 0px 5px 0px 10px;" />
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false"
                                        ShowMessageBox="true" ValidationGroup="PostNewsEvent" />
                                </div>
                            </div>
                        </div>
                    </div>

        <%--<div class="line"></div>--%>

                    <div class="col-lg-6">
                        <div class="card">
                            <h3 class="card-header primary-color white-text">
                                Search Product</h3>
                            <div class="card-body">
                                <label class="control-label">
                                    Search<span class="star"> </span>
                                </label>
                                <div class="input-group" style="margin: 0px 0px 32px 0px;">
                                    <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                                        CssClass="btn btn-info" Style="margin: 0px 0px 0px 5px;" />
                                </div>
                                <asp:GridView ID="dgvSearch" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                                    OnRowCommand="dgvSearch_RowCommand" DataKeyNames="ProductID" AllowPaging="True" Width="100%"
                                    OnPageIndexChanging="dgvSearch_PageIndexChanging" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" AllowSorting="True" BorderStyle="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="ProductID" HeaderText="ID" Visible="false">
                                            <ItemStyle Width="125px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProductName" HeaderText="Full Name">
                                            <ItemStyle Width="100%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CurrentStock" HeaderText="Current Stock">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" Visible="false">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:Button ID="btneditg" runat="server" CommandName="editx" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                    Text="EDIT" CausesValidation="false" CssClass="btn btn-info" />
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DELETE">
                                            <ItemTemplate>
                                                <asp:Button ID="delbtn" runat="server" OnClientClick="return confirm('Are you sure to DELETE this data');"
                                                    CommandName="delindex" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                    Text="Delete" CssClass="btn btn-danger" />
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings FirstPageText="&lt;" LastPageText="&gt;" Mode="NumericFirstLast" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle CssClass="gridview" />
                                </asp:GridView>

                                <asp:HiddenField ID="HiddenFieldGridEdit" runat="server" />

                            </div>
                        </div>
                    </div>

               </div>


            <%--      HERE WE GO       --%>
            </div>



            </div>
    </div>
    </form>


    <!-- jQuery CDN - Slim version (=without AJAX) for side nav pan -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
    <!--for side nav pan -->

</body>
</html>
