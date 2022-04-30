<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <img src="images/Pizza-banner.jpg" width="100%" height="350" />
    

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
                          <a href="singleproduct.aspx?pro_id=<%=product.pid %>">  <img src="<%=product.img %>" class="img-fluid" alt="" height="250" width="250" /></a>
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

