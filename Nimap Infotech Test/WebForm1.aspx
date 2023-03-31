<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Nimap_Infotech_Test.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nimap Infotech</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 146px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1 class="text-center"> Crud Application</h1>
    <div class="container">
    <div class="row">
    <div class="form-group col-md-6">
        <table class="w-100 table table-border table-hover">
            <tr>
                <td class="auto-style2">Category ID</td>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" Visible="False" ControlToValidate="TextBox1" SetFocusOnError="True">Field Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Category Name</td>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"  colspan="2">
                    <asp:Button CssClass="btn btn-primary mx-2" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                    <asp:Button CssClass="btn btn-secondary mx-2" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                    <asp:Button CssClass="btn btn-danger mx-2" ID="Button5" runat="server" Text="Delete" OnClick="Button5_Click" />
                </td>
            </tr>
        </table>
    </div>

        <div class="form-group col-md-6">
            <table class="w-100 table table-border table-hover">
                <tr>
                    <td class="auto-style2">Product ID</td>
                    <td>
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" Visible="False" ControlToValidate="TextBox3" SetFocusOnError="True">Field Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Product Name</td>
                    <td>
                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:Button  CssClass="btn btn-primary mx-2" ID="Button3" runat="server" Text="Add" OnClick="Button3_Click" />
                        <asp:Button  CssClass="btn btn-secondary mx-2" ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
    </div>
        </div>
        </div>
    
        <div class="container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="category_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" />
                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                    <asp:BoundField DataField="category_id" HeaderText="category_id" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs %>" SelectCommand="SELECT product.productId AS product_id, product.productName AS product_name, category.categoryId AS category_id, category.categoryName AS category_name FROM product INNER JOIN category ON product.productId = product.productId"></asp:SqlDataSource>
        </div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </form>
</body>
</html>
