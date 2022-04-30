<%@ Page Title="" Language="C#" MasterPageFile="~/admin panel/admin.master" AutoEventWireup="true" CodeFile="orderdetails.aspx.cs" Inherits="admin_panel_orderdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <img src="../images/Pizza-banner.jpg" width="100%" height="350" />

    <div class="content-wrapper">
    <section class="content container-fluid">
    <div class="row">
            <div class="col-md-11">
                <div class="panel panel-info">
                    <div class="text-center" style="font-size:24px"><strong style="font-size:42px;color:#780a0a"><em>Order Summary</em></strong></div>
                    <div class="panel-body">

                        <h4 class="btn btn-primary">Customer Name : <%=name %> </h4>
       <h4 class="btn btn-primary" >Email : <%=email %> </h4>
        <br />
        <br />
                        <asp:GridView runat="server" ID="GridView1"
                            AutoGenerateColumns="False"
                            DataSourceID="details_ds" Height="213px" Width="839px" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" Font-Size="16pt" />
                            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imff" ImageUrl='<%#"../"+Eval("img") %>' Height="50px" Width="60px" />
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:BoundField DataField="pname" HeaderText="name" SortExpression="name"></asp:BoundField>

                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>

                                <asp:BoundField DataField="category" HeaderText="Category" ItemStyle-CssClass="avlQty">

                                    <ItemStyle CssClass="avlQty"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="quantity" HeaderText="Quantity" ItemStyle-CssClass="avlQty">

                                    <ItemStyle CssClass="avlQty"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="netPrice" HeaderText="total price" ItemStyle-CssClass="avlQty">




                                    <ItemStyle CssClass="avlQty"></ItemStyle>
                                </asp:BoundField>




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
        <br />
        <asp:Label runat="server" ID="lb" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" ForeColor="#996600" CssClass="top-right" ></asp:Label>  <i class="fa fa-inr" style="font-size:27px"></i>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" Text="View Payment" CssClass="btn btn-primary" ID="btn1" OnClick="btn1_Click" />
        <br />
        <%--<asp:Label runat="server" Text="Order Dispatched Successfully" CssClass="btn btn-primary" ID="btn2" />--%>         
        
          

       <asp:SqlDataSource runat="server" ID="details_ds" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="select p.pname,p.price,p.img,c.category,c.netPrice,c.quantity from order_tb o inner join cart_tb c on c.session_id=o.session_id inner join items_tb p on c.product_id=p.pid Where o.session_id=@session_id">
            
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="order_id" Name="session_id"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>


        <br />


        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView runat="server" ID="paymentgv" AutoGenerateColumns="False" DataKeyNames="o_id" DataSourceID="SqlDataSource1" Height="200px" Width="900px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">

                <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" Font-Size="16pt" />
                <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />

                <Columns>

                    <asp:BoundField DataField="c_name" HeaderText="Name" SortExpression="c_name"></asp:BoundField>
                    <asp:BoundField DataField="c_phone" HeaderText="Phone" SortExpression="c_phone"></asp:BoundField>
                    <asp:BoundField DataField="c_address" HeaderText="Address" SortExpression="c_address"></asp:BoundField>
                    <asp:BoundField DataField="c_email" HeaderText="Email" SortExpression="c_email"></asp:BoundField>
                    <asp:BoundField DataField="card_no" HeaderText="Card_no" SortExpression="card_no"></asp:BoundField>
                    <asp:BoundField DataField="expiration" HeaderText="Expiration" SortExpression="expiration"></asp:BoundField>
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date"></asp:BoundField>
                </Columns>

                <FooterStyle HorizontalAlign="Right" BackColor="White" ForeColor="#333333"></FooterStyle>

                <HeaderStyle HorizontalAlign="Left" BackColor="#336666" Font-Bold="True" ForeColor="White" Font-Size="16pt"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>

            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="SELECT * FROM [order_tb] WHERE ([session_id] = @session_id)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="order_id" Name="session_id" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <%--<asp:Button runat="server" ID="disp" Text="Dispatch order" CssClass="btn btn-primary" />--%>


        
        <script type="text/javascript">
            $(function () {
                $('[id*=Panel1]').hide();
                $('[id*=disp]').hide();

                $('[id*=btn1]').click(function () {

                    $('[id*=Panel1]').show();
                    $('[id*=disp]').show();



                    return false;
                });

            });


            </script>
                  
                                

              
				</div>
			
                </div>
        </div>
        </div>
        </section>
    </div>

</asp:Content>

