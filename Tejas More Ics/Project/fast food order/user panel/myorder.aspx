<%@ Page Title="" Language="C#" MasterPageFile="~/user panel/user.master" AutoEventWireup="true" CodeFile="myorder.aspx.cs" Inherits="user_panel_myorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
            text-align: center;
            color: #993300;
        }
        .auto-style3 {
            color: #993300;
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
                    <div class="auto-style2"><strong><em>My Orders</em></strong></div>
                    <div class="panel-body">

   



                         <%if (ordergv.Rows.Count > 0)
                  {%><br />
    <br />
&nbsp;
        
      
            <asp:GridView ID="ordergv" runat="server" AutoGenerateColumns="False" DataKeyNames="o_id" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black"
                Height="200px" Width="1200px">

                <Columns>

                    <asp:HyperLinkField DataNavigateUrlFields="session_id" DataNavigateUrlFormatString="orderdetail.aspx?order_id={0}" HeaderText="order id" DataTextField="session_id" />
                    <asp:BoundField DataField="c_name" HeaderText="Name" SortExpression="c_name"></asp:BoundField>
                    <asp:BoundField DataField="c_phone" HeaderText="Phone" SortExpression="c_phone"></asp:BoundField>
                    <asp:BoundField DataField="c_address" HeaderText="Address" SortExpression="c_address"></asp:BoundField>
                    <asp:BoundField DataField="c_email" HeaderText="Email" SortExpression="c_email"></asp:BoundField>
                    <asp:BoundField DataField="card_no" HeaderText="Card Number" SortExpression="card_no"></asp:BoundField>
                    <asp:BoundField DataField="expiration" HeaderText="expiration" SortExpression="expiration"></asp:BoundField>

                    <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount"></asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            <%}
          else
          {%>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="SELECT * FROM [order_tb] WHERE ([c_email] = @c_email)">
                <SelectParameters>
                    <asp:SessionParameter SessionField="username" Name="c_email" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <h1><b>No Order Available</b></h1>
                         <p>&nbsp;</p>
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

