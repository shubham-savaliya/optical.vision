<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

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
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1d3557, #457b9d);
            margin: 0;
            padding: 0;
        }

        .login-container {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            width: 350px;
            text-align: center;
        }

            .login-box h2 {
                margin-bottom: 25px;
                color: #1d3557;
            }

            .login-box input,
            .login-box asp\:TextBox {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border-radius: 8px;
                border: 1px solid #ccc;
                font-size: 16px;
            }

            .login-box button,
            .login-box asp\:Button {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 8px;
                background: #1d3557;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

                .login-box button:hover,
                .login-box asp\:Button:hover {
                    background: #457b9d;
                }

            .login-box p {
                margin-top: 15px;
                font-size: 14px;
                color: #555;
            }
    </style>
        
            <div class="login-container">
                <div class="login-box">
                    <h2>Admin Login</h2>

                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Enter Username"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        
</asp:Content>

