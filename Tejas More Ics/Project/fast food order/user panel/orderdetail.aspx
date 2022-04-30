<%@ Page Title="" Language="C#" MasterPageFile="~/user panel/user.master" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="user_panel_orderdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            color: #CC3300;
        }
        .auto-style2 {
            font-size: xx-large;
            color: #CC9900;
            text-align: center;
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
                    <div class="auto-style2"><strong><em>Order Summary</em></strong></div>
                    <div class="panel-body">

                        <asp:GridView runat="server" ID="GridView1"
                            AutoGenerateColumns="False"
                            DataSourceID="details_ds" Height="268px" Width="946px" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
                            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imff" ImageUrl='<%#"../"+Eval("img") %>' Height="50px" Width="60px" />
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:BoundField DataField="pname" HeaderText="name" SortExpression="name"></asp:BoundField>

                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>

                                <asp:BoundField DataField="category" HeaderText="Catagory" ItemStyle-CssClass="avlQty" />

                                <asp:BoundField DataField="quantity" HeaderText="Quantity" ItemStyle-CssClass="avlQty" />

                                <asp:BoundField DataField="netPrice" HeaderText="total price" ItemStyle-CssClass="avlQty" />




                            </Columns>

                            <FooterStyle HorizontalAlign="Right" BackColor="White" ForeColor="#333333"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Left" BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
        </asp:GridView>

                       <asp:Label runat="server" ID="lb" CssClass="auto-style1"></asp:Label> <i class="fa fa-inr" style="font-size:27px"></i>

    <asp:SqlDataSource runat="server" ID="details_ds" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="select p.pname,p.price,p.img,c.category,c.netPrice,c.quantity from order_tb o inner join cart_tb c on c.session_id=o.session_id inner join items_tb p on c.product_id=p.pid Where o.session_id=@session_id">
            
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="order_id" Name="session_id"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
                  
                                

              
				</div>
			
                </div>
        </div>
        </div>

        <br /><br />
        </section>
    </div>

   


</asp:Content>

