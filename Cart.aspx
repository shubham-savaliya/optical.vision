﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 100px;">
        <center>
            <h1 class="display-4 fw-bold text-dark mb-4">
                <i class="bi bi-cart3 text-warning me-3"></i>Your Cart
            </h1>

            <asp:Button ID="Continue_Shopping" runat="server" Text="Continue Shopping" OnClick="Continue_Shopping_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="h5 text-muted"></asp:Label>

            <div class="card shadow-lg border-0">
                <div class="card-body">
                    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand"
                        CssClass="table table-hover table-borderless" GridLines="None" ShowHeader="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="text-center fw-bold" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="rounded shadow" Width="80" Height="80" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product" HeaderStyle-CssClass="fw-bold">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>' CssClass="h6 fw-bold text-dark"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="text-center fw-bold" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "₹" + Eval("Price") %>' CssClass="h6 text-success fw-bold"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center fw-bold" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <asp:LinkButton ID="lnkMin" runat="server" CommandName="cmd_minus" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="btn btn-outline-warning btn-sm">
                                            <i class="bi bi-dash"></i>
                                        </asp:LinkButton>
                                        &nbsp;
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Quantity") %>' CssClass="h6 fw-bold mx-3"></asp:Label>
                                        &nbsp;
                                        <asp:LinkButton ID="lnkPlu" runat="server" CommandName="cmd_plus" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="btn btn-outline-warning btn-sm">
                                            <i class="bi bi-plus"></i>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Cost" HeaderStyle-CssClass="text-center fw-bold" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# "₹" + Eval("Total") %>' CssClass="h6 text-warning fw-bold"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="text-center fw-bold" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRem" runat="server" CommandArgument='<%# Eval("Cart_Id") %>' CommandName="cmd_remove" CssClass="btn btn-danger btn-sm">
                                        <i class="bi bi-trash"></i> Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="mt-4">
                <asp:Button ID="btnUpd" runat="server" Text="Update Cart" OnClick="btnUpd_Click" />
                <asp:Button ID="btnchkOut" runat="server" Text="Check Out" OnClick="btnchkOut_Click" />
                <br />
                <br />
                <asp:Label ID="lblFinalTotal" runat="server" Text="" CssClass="h5 fw-bold"></asp:Label>
            </div>
        </center>
    </div>
</asp:Content>
