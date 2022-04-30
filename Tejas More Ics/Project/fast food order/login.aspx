<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style25 {
            font-size: xx-large;
            font-weight: 700;
            color: #0033CC;
        }
        .auto-style26 {
            color: #990000;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


               <img src="images/Pizza-banner.jpg" width="100%" height="350" />

    <div class="content-wrapper">
    <section class="content container-fluid">
    <div class="row">
            <div class="col-md-11">
                <div class="panel panel-info">
                    <div class="auto-style26" style="font-size:42px"><strong><em>Login Now</em></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
						

                        <br />
                        <asp:Label runat="server" ID="msg" CssClass="auto-style25"></asp:Label>
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style7">Username : </asp:Label><asp:TextBox runat="server" ID="username" BorderColor="Gray" BorderWidth="2" Height="41px" Width="234px" required="" ></asp:TextBox>
						<br />
						<br />
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style7">Password : </asp:Label>&nbsp;<asp:TextBox runat="server" ID="password" BorderColor="Gray" BorderWidth="2" TextMode="Password" Height="41px" Width="234px" required="" ></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button runat="server" ID="loginbtn" Text="Log In" OnClick="loginbtn_Click" CssClass="btn btn-danger circle arrow" Height="49px" Width="135px" />
					    <br />
                        <br />

					</div>
					
				</div>
			</div>
                        </div>
                    </div>
                </div>
        </div>
        </section>
    </div>
    

</asp:Content>

