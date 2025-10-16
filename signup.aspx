<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" /> 
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
         body {
            font-family: 'Poppins', sans-serif !important;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .signup-container {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.15);
            padding: 40px;
            max-width: 850px;
            width: 100%;
        }

        .signup-container h2 {
            font-weight: 600;
            color: #222;
            margin-bottom: 25px;
            text-align: center;
        }

        .signup-container table {
            width: 100%;
            border-collapse: separate !important;
            border-spacing: 18px 16px !important;
        }

        .signup-container td {
            vertical-align: middle;
        }

        .signup-container .form-label {
            font-weight: 500;
            color: #333;
            text-align: right;
            display: block;
            padding-right: 15px;
            width: 160px;
            white-space: nowrap;
        }

        
        .signup-container .form-control, 
        .signup-container .form-select {
            border-radius: 8px !important;
            padding: 10px 14px !important;
            border: 1px solid #ccc !important;
            width: 100% !important;
            box-sizing: border-box;
            font-size: 15px !important;
            transition: all 0.3s ease;
        }

        .signup-container .form-control:focus, 
        .signup-container .form-select:focus {
            border-color: #4facfe !important;
            box-shadow: 0 0 6px rgba(79, 172, 254, 0.4) !important;
            outline: none !important;
        }

        
        .signup-container .btn-signup {
            background: #4facfe;
            color: #fff;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            width: 40%;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .signup-container .btn-signup:hover {
            background: #2196f3;
            transform: translateY(-2px);
            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
        }

        .signup-container .extra-links {
            text-align: center;
            margin-top: 20px;
        }

        .signup-container .extra-links a {
            text-decoration: none;
            color: #2196f3;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="signup-container">
        <h2>Create Your Account</h2>
        <table>
            <tr>
                <td><asp:Label runat="server" AssociatedControlID="txtFullName" CssClass="form-label" Text="Full Name"></asp:Label></td>
                <td><asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="John Doe" required="true"></asp:TextBox></td>
                <td><asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email Address"></asp:Label></td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@example.com" required="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" AssociatedControlID="txtPhone" CssClass="form-label" Text="Phone Number"></asp:Label></td>
                <td><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+91 98765 43210" required="true"></asp:TextBox></td>
                <td><asp:Label runat="server" AssociatedControlID="txtDOB" CssClass="form-label" Text="Date of Birth"></asp:Label></td>
                <td><asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" AssociatedControlID="txtAddress" CssClass="form-label" Text="Address"></asp:Label></td>
                <td colspan="3"><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Street, City, State, Zip" required="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" AssociatedControlID="ddlLensType" CssClass="form-label" Text="Preferred Lens Type"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlLensType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Single Vision" Value="single-vision" />
                        <asp:ListItem Text="Bifocal" Value="bifocal" />
                        <asp:ListItem Text="Progressive" Value="progressive" />
                        <asp:ListItem Text="Contact Lenses" Value="contact-lenses" />
                    </asp:DropDownList>
                </td>
                <td><asp:Label runat="server" AssociatedControlID="ddlFrameStyle" CssClass="form-label" Text="Preferred Frame Style"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlFrameStyle" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Full Rim" Value="full-rim" />
                        <asp:ListItem Text="Half Rim" Value="half-rim" />
                        <asp:ListItem Text="Rimless" Value="rimless" />
                        <asp:ListItem Text="Sunglasses" Value="sunglasses" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password"></asp:Label></td>
                <td><asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" required="true"></asp:TextBox></td>
                <td><asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label" Text="Confirm Password"></asp:Label></td>
                <td><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter password" required="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3" style="text-align:center; padding-top:10px;">
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn-signup" OnClick="btnSignUp_Click" />
                </td>
            </tr>
        </table>
        <div class="extra-links">
            <p>Already have an account? <a href="login.aspx">Sign In</a></p>
        </div>
    </div>
</asp:Content>
