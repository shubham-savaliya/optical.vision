<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_dashboard.aspx.cs" Inherits="admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .dashboard-title {
            text-align: center;
            color: #1d3557;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
        }

        .styled-table {
            width: 100%;
            border-collapse: collapse;
        }

            .styled-table td {
                padding: 12px;
                vertical-align: middle;
            }

                .styled-table td:first-child {
                    width: 30%;
                    font-weight: 600;
                    color: #333;
                }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: 0.3s;
        }

            .form-control:focus {
                border-color: #457b9d;
                box-shadow: 0 0 6px rgba(69, 123, 157, 0.5);
                outline: none;
            }

        .btn-submit {
            background: #1d3557;
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

            .btn-submit:hover {
                background: #457b9d;
            }
    </style>

    <h1 class="dashboard-title">Admin Dashboard</h1>

    <div class="form-container">
        <table class="styled-table">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtdesc" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label></td>
                <td>
                    <asp:FileUpload ID="flpImg" runat="server" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn-submit" OnClick="btnInsert_Click" />
                </td>
            </tr>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </table>
    </div>
    <h4>Product List</h4>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="5" GridLines="None" BorderStyle="Solid" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <img src='<%# Eval("Image") %>' alt="Product Image" width="100" height="100" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>




</asp:Content>

