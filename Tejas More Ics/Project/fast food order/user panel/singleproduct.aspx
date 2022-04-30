<%@ Page Title="" Language="C#" MasterPageFile="~/user panel/user.master" AutoEventWireup="true" CodeFile="singleproduct.aspx.cs" Inherits="singleproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #CC6600;
        }
        .auto-style3 {
            font-size: 42px;
            color: #FF5050;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <img src="../images/Pizza-banner.jpg" width="100%" height="350" />

	


    <section class="welcome-area section-padding2">
        <div class="container-fluid">
            <div class="text-center">
                <strong><span class="auto-style3">Pizza Detail</span></strong>
            </div><br /><br /><br />
            <div class="row">

                    <% 
                    if (product_list.Count > 0)
                    { 
                    
                    foreach (var product in product_list)
                   {%>

                <div class="col-md-6 align-self-center">
                    <div class="welcome-img">
                        <img src="../<%=product.img %>" class="img-fluid" alt="" />
                    </div>
                </div>
                <div class="col-md-6 align-self-center">
                    <div class="welcome-text mt-5 mt-md-0">
                        <h3><span class="style-change">Pizza Name : </span> </h3>  <b style="font-size:26px;color:black">  <%=product.pname %> </b>  
                        <h3><span class="style-change">Category : </span> </h3><b style="font-size:26px;color:black"> <%=product.category %> </b>
                        <h3><span class="style-change">Price : </span> </h3><b style="font-size:26px;color:black"> <%=product.price %> </b> <br /><br />
                        <a href="singleproduct.aspx?bid=<%=prod_id %>&pro_id=<%=product.pid %>&action=add" class="template-btn mt-3">Add To Cart</a>
                    </div>
                </div>


                               <%}
                   }
                   else
                   {%>
                        <h2 class="auto-style2">No Menu Avaliable</h2>
                   <%}%>

            </div>
            <br />
            <br />
        </div>
    </section>

    

</asp:Content>

