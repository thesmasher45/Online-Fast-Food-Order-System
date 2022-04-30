<%@ Page Title="" Language="C#" MasterPageFile="~/user panel/user.master" AutoEventWireup="true" CodeFile="mycart.aspx.cs" Inherits="user_panel_mycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
            color: #3366FF;
            text-align: center;
        }
        .auto-style3 {
            color: #FF9900;
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
                    <div class="auto-style2"><strong><em>My Shopping Cart</em></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
                        <br />


<%if (GridView1.Rows.Count > 0)
      {
           
       %>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true" Height="300px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
                            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imff" ImageUrl='<%#"../"+Eval("img")%>' Height="50px" Width="60px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="pname" HeaderText="Name" />
                                <asp:BoundField DataField="category" HeaderText="Catagory" ItemStyle-CssClass="avlQty" />
                                <asp:BoundField DataField="price" DataFormatString="{0:0.00}" ItemStyle-CssClass="price"
                                    HeaderText="Price" />
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxQty" CssClass="txtQty" runat="server" BorderColor="Gray" BorderWidth="2" Text='<%#Eval("Qty")%>' MaxLength="5" Width="45"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxQty" Display="Dynamic" ForeColor="Red" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="delete">
                                    <ItemTemplate>
                                        <asp:Button ID="delete" runat="server" Text="delete" CssClass="btn btn-primary submit mb-4" OnClick="delete_Click" CommandName="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Net Price">
                                    <ItemTemplate>
                                        <span class="totalPrice"></span>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        Total: <span class="grandtotal" style="font-size: 22px"></span>
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                            <FooterStyle HorizontalAlign="Right" BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Left" BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView><br />
        <asp:Button ID="Button1" CssClass="btn btn-primary submit mb-4"  runat="server" Text="Proceed To checkout" OnClick="Button1_Click" Height="48px" Width="223px" />
        


                <%}
                   else
                   {%>
                <h2 class="auto-style3"><em>&nbsp;&nbsp;&nbsp; Cart Is Empty</em></h2>
                        <p class="auto-style3">&nbsp;</p>
                <%} %>


                        <asp:Label ID="label1" runat="server"></asp:Label>

                        </div></div></div></div></div></div></div></section></div>

    <script type="text/javascript">
        //Change price and grand total on changing qty
        $('#<%=GridView1.ClientID %> .txtQty').blur(function () {
            var $tr = $(this).parents('tr');
            if ($tr.length > 0) {
                if (parseInt($tr.find('.avlQty').html()) < $(this).val()) {
                    alert('Qty must not exceed available quantity.');
                    var $ctrl = $(this);
                    window.setTimeout(function () {
                        $ctrl.focus();
                    }, 50);
                    return false;
                }
                $tr.find('.totalPrice').html(parseFloat($tr.find('.price').html()) * parseInt($(this).val()));
            }
            CalculateGrandTotal();
        });

        //To get grand Total
        function CalculateGrandTotal() {
            var grandTotal = 0.0;
            $('#<%=GridView1.ClientID %> tr:gt(0)').each(function () {
                grandTotal = grandTotal + parseFloat($(this).find('.totalPrice').length == 0 || !$(this).find('.totalPrice').html() ? 0 : $(this).find('.totalPrice').html());
            });
            $('#<%=GridView1.ClientID %> .grandtotal').html(grandTotal);
        }

        //To allow numeric character only
        $('#<%=GridView1.ClientID %> .txtQty').keydown(function (event) {
            // Allow: backspace, delete, tab, escape, and enter
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                // Allow: Ctrl+A
        (event.keyCode == 65 && event.ctrlKey === true) ||
                // Allow: home, end, left, right
        (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        //First Time to display all total amount and grand total
        function initGrid() {
            $('#<%=GridView1.ClientID %> tr:gt(0)').each(function () {
                $(this).find('.totalPrice').html(parseFloat($(this).find('.price').html()) * parseInt($(this).find('.txtQty').val()));

            });
            CalculateGrandTotal();
        }
        initGrid();
    </script>

</asp:Content>

