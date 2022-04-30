<%@ Page Title="" Language="C#" MasterPageFile="~/user panel/user.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="user_panel_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-size: 42px;
            text-align: center;
            color: #996600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <img src="../images/Pizza-banner.jpg" width="100%" height="350" />

    <div class="content-wrapper">
    <section class="content container-fluid">
    <div class="row">
            <div class="col-md-11">
                <div class="panel panel-info">
                    <div class="auto-style2"><strong><em>Checkout</em></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
                        <asp:Label runat="server" ID="msg"></asp:Label>
                        <h3><strong>Personal Information</strong></h3>
                                                    <p>&nbsp;</p>				
													<h5><span class="newStyle1">FULL NAME</span></h5>
														<asp:TextBox runat="server"  BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" ID="textbox1" required=""></asp:TextBox>
													<h5><span class="newStyle1">ADDRESS</span></h5>													
														<asp:TextBox runat="server"  BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" ID="textbox2" required=""></asp:TextBox>
														<h5><span class="newStyle1">MOBILE NUMBER</span></h5>													
														<asp:TextBox runat="server"  BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" ID="textbox3" required=""></asp:TextBox>
														<h5><span class="newStyle1">EMAIL ADDRESS</span></h5>													
														<asp:TextBox runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" ID="textbox4" required=""></asp:TextBox>
														
												    <br />
														<br />
															
											
											<h3 class="pay-title"><strong>Credit Card/Debit Card Info</strong></h3>
                                                        <p class="pay-title">&nbsp;</p>
											<div>
												<div class="tab-for">				
													<h5><span class="newStyle1">NAME ON CARD</span></h5>
														<asp:TextBox runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px"   ID="textbox5" required=""></asp:TextBox>
													<h5>&nbsp;</h5>
                                                    <h5><span class="newStyle1">CARD NUMBER</span></h5>													
														<asp:TextBox runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px"  ID="textbox6" required="" TextMode="Number"></asp:TextBox>
                                                  </div>
												<div class="transaction">
													<div class="tab-form-left user-form">
														<h5>&nbsp;</h5>
                                                        <h5><span class="newStyle1">EXPIRATION</span></h5>
															
																	<asp:TextBox runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="100px" ID="textbox7"  required=""></asp:TextBox>	<br /><br />
																
																	<asp:TextBox runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="100px" ID="textbox8"   required=""></asp:TextBox>	
																
																
															
													</div>
													<div class="tab-form-right">
														<h5>&nbsp;</h5>
                                                        <h5><span class="newStyle1">CVV NUMBER</span></h5>													
														<asp:TextBox ID="TextBox9" runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" required=""></asp:TextBox>

                                                        <br />
                                                        <br />
                                                        <br />

                                                        <asp:Button runat="server" ID="order" Text="Make Payment" CssClass="btn btn-primary"  Height="71px" Width="201px" OnClick="order_Click" />


                                                        <br />
                                                        <br />


</div></div></div>
                                                        
                        </div>
                    </div>
        </div>

                        </div>
                    </div>
                </div></div>
        </section>
        </div>
</asp:Content>

