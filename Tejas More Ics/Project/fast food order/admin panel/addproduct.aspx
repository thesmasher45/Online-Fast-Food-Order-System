<%@ Page Title="" Language="C#" MasterPageFile="~/admin panel/admin.master" AutoEventWireup="true" CodeFile="addproduct.aspx.cs" Inherits="admin_panel_addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #990000;
            font-size:42px;
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
                    <div class="text-center"><strong style="font-size:24px"><span class="auto-style2"><em>Enter Product details<br />
                        </em></span><br />
                        <asp:Label runat="server" ID="msg"></asp:Label></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">


                         <label>Product Name :<br /> <asp:TextBox runat="server" ID="pname" BorderColor="Gray" BorderWidth="2" Height="41px" Width="250px" required=""></asp:TextBox></label>
                        <br />
                        <label>Product Price : <br /><asp:TextBox ID="pprice" runat="server" BorderColor="Gray" BorderWidth="2" Height="41px" Width="250px"  required=""></asp:TextBox></label>
                        <br />

                        <label>Product Type : <br /><asp:DropDownList ID="drpcatelst" runat="server" BorderColor="Gray" BorderWidth="2" Height="50" Width="250"   >
                                
                                <asp:ListItem>Garlic Pizza</asp:ListItem>
                                <asp:ListItem>Mushrooms Pizza</asp:ListItem>
                                <asp:ListItem>Onions Pizza</asp:ListItem>
                                <asp:ListItem>Chicken Pizza</asp:ListItem>
                                <asp:ListItem>Pepperoni Pizza</asp:ListItem>                              
                            </asp:DropDownList></label><br />
                        <label>Product Image : <br /><asp:FileUpload ID="fileupload1" runat="server" BorderColor="Gray" BorderWidth="2" Height="40px" Width="250px" required="" /></label><br />
                        <br />
                        <asp:Button runat="server" ID="add_btn" CssClass="btn btn-primary" Text="Add product" OnClick="add_btn_Click" />
                         <br /><br /><br />
                    </div>
                   
                        
                        
                    


                        </div>
                    </div>
        </div>
                        </div>
                    </div>
                </div></section>
        </div>
        
        
    


</asp:Content>

