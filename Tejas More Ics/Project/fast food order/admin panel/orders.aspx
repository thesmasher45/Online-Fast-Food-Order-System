<%@ Page Title="" Language="C#" MasterPageFile="~/admin panel/admin.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="admin_panel_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            color: #990033;
        }
        .auto-style3 {
            color: #993333;
            font-size: 30px;
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
                    <div class="auto-style2" style="font-size:42px"><strong><em>Orders</em></strong></div>
                    <div class="panel-body">

   



                         <%if (ordergv.Rows.Count > 0)
                  {%><br />
    <br />
&nbsp;
        
      
            <asp:GridView ID="ordergv" runat="server" AutoGenerateColumns="False" DataKeyNames="o_id" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                Height="200px" Width="1200px" GridLines="Horizontal">

                <Columns>

                    <asp:HyperLinkField DataNavigateUrlFields="session_id" DataNavigateUrlFormatString="orderdetails.aspx?order_id={0}" HeaderText="order id" DataTextField="session_id" />
                    <asp:BoundField DataField="c_name" HeaderText="Name" SortExpression="c_name"></asp:BoundField>
                    <asp:BoundField DataField="c_email" HeaderText="Email" SortExpression="c_email"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

            <%}
          else
          {%>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="SELECT * FROM [order_tb]">
                
            </asp:SqlDataSource>
            <h1 class="auto-style3">No Order Available</h1>
                  <%}
                 %>



                       
					
				</div>
			
                </div>
        </div>
        </div>
        <br />
        <br />
        </section>
    </div>

</asp:Content>

