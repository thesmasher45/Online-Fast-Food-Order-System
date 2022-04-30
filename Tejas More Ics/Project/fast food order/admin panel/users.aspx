<%@ Page Title="" Language="C#" MasterPageFile="~/admin panel/admin.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="admin_panel_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #990000;
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
                    <div class="text-center"><strong style="font-size:42px"><span class="auto-style2"><em>Users Details</em></span><br />
                        <asp:Label runat="server" ID="msg"></asp:Label></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">

                  <%
                      if (gv1.Rows.Count > 0)
                      {     
                      
                       %>

                      <br />

                        <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Height="154px" Width="902px">

                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="first" HeaderText="first" SortExpression="first"></asp:BoundField>
                                <asp:BoundField DataField="last" HeaderText="last" SortExpression="last"></asp:BoundField>
                                <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile"></asp:BoundField>
                                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#999999"></EditRowStyle>

                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>

                        <%}

                      else
                      {%>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="SELECT [first], [last], [mobile], [address], [email] FROM [registration_tb]"></asp:SqlDataSource>
                        <h1>No User Registered</h1> 
                      <%} %> 
        
                        <br /><br />

                        </div>
                    </div>
        </div>
                        </div>
                    </div>
                </div></section>
        </div>

</asp:Content>

