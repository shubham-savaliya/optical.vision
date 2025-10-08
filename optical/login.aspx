<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Bootstrap + Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0px 8px 25px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 420px;
            width: 100%;
            align-content:center;
            justify-items: center;

        }

            .login-container h2 {
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }

        .form-control {
            border-radius: 10px;
            padding: 12px;
        }

        .btn-login {
            background: #3b82f6;
            color: #fff;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
        }

            .btn-login:hover {
                background: #2563eb;
            }

        .extra-links {
            text-align: center;
            margin-top: 15px;
        }

            .extra-links a {
                text-decoration: none;
                color: #3b82f6;
                font-weight: 500;
            }

        .brand-logo {
            display: block;
            margin: 0 auto 20px auto;
            width: 80px;
        }

        .error-message {
            color: red;
            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="Server">
    <center>
    <div class="login-container" align="left" >
        <h2>Welcome Back</h2>

        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email Address"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@example.com"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-login" OnClick="btnLogin_Click" />

        <div class="extra-links">
            <p><a href="#">Forgot Password?</a></p>
            <p>Don't have an account? <a href="signup.aspx">Sign Up</a></p>
        </div>
        <div>
            <asp:Label ID="lblMessage" CssClass="error-message" runat="server" Text=""></asp:Label>
        </div>
    </div>
        </center>
</asp:Content>
