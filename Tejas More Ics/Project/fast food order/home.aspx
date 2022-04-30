<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #990000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

           <img src="images/bg1.jpg" width="100%" height="550" />

    <section class="welcome-area section-padding2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <div class="welcome-img">
                        <img src="images/home.png" class="img-fluid" alt="" />
                    </div>
                </div>


                <div class="col-md-6 align-self-center">
                    <div class="welcome-text mt-5 mt-md-0">
                        <h3><span class="style-change">Welcome</span> <br>To Pizza Home</h3>
                        <p class="pt-3">This online ordering software was built with strong focus on the needs of pizza restaurants.</p>
                        <p>From menu to promotions and delivery settings, we’re very confident that you’ll find all that you need to run a successful business online.</p>
                        <a href="#" class="template-btn mt-3">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />
    <br />
    <center><h1 class="auto-style2">Our Popular Pizza's</h1></center> <br /><br />

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="section-top">
                       <center> <h3><span class="style-change">Our Menus</span> <br />delicious food</h3></center>
                    </div>
                </div>
            </div>

            <div class="row">
                       <%
                    if (product_list.Count > 0)
                    {
                        
                        foreach (var product in product_list)
                   {
                            %>
                <div class="col-md-4 col-sm-6">
                    <div class="single-food">


                  


                        <div class="food-img">
                          <a href="singleproduct.aspx?pro_id=<%=product.pid %>">  <img src="<%=product.img %>" class="img-fluid" alt="" /></a>
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5><%=product.pname %></h5><br />
                            
                            </div>
                            <p class="pt-6">Price :    <span class="fa fa-inr"><%=product.price %></span></p>

                            <a href="singleproduct.aspx?pro_id=<%=product.pid %>" class="btn btn-primary">View Item</a><br />
                        </div>

                    </div>
                </div>
                
                                     <%}
                   }
                   else
                   {%>
                        <h2>No Menu Avaliable</h2>
                   <%}%>
                
                </div>
            
            <br />
               
            </div>




</asp:Content>

