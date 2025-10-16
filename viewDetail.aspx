<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewDetail.aspx.cs" Inherits="viewDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Styling DataList as a grid */
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .product-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 250px;
            text-align: center;
            padding: 15px;
            transition: all 0.3s ease;
        }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            }

            .product-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 8px;
            }

        .product-name {
            font-size: 18px;
            font-weight: 600;
            color: #222;
            margin: 10px 0 5px;
        }

        .product-code {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .product-price {
            margin-top: 8px;
            font-size: 16px;
            font-weight: 600;
            color: #1a8f3a;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <h1>Product Details</h1>

        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="product-list">
            <ItemTemplate>
                <div class="product-card">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' AlternateText="Product Image" />
                    <div class="product-name">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </div>
                    <div class="product-code">
                        Description: 
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </div>
                    <div class="product-price">
                        Price: ₹<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>


