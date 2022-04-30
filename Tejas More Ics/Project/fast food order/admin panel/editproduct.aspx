<%@ Page Title="" Language="C#" MasterPageFile="~/admin panel/admin.master" AutoEventWireup="true" CodeFile="editproduct.aspx.cs" Inherits="admin_panel_editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style2 {
            color: #990000;
            font-size:42px;
            text-align:center;
        }
    </style>

    <style type="text/css">
        .auto-style3 {
            color: #990000;
            font-size:32px;
            text-align:center;
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
                    <div class="text-center"><span class="auto-style2"><em><strong>Edit Product details</strong><br />
                        </em></span><br />
                        <asp:Label runat="server" ID="msg"></asp:Label></strong></div>
                    <div class="panel-body">

    <div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">






                        <strong class="auto-style1"><span class="auto-style3">Search product :</span></strong> <asp:TextBox runat="server" ID="searchprd" BorderColor="Gray" BorderWidth="2" Height="41px" Width="250px"></asp:TextBox> &nbsp;<asp:Button runat="server" ID="searchbtn" Text="Search"  CssClass="btn btn-primary" OnClick="searchbtn_Click" />&nbsp; <asp:Button runat="server" ID="display_all" Text="display all"  CssClass="btn btn-primary" OnClick="display_all_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <br /><br />
                     <%
                            if (gridview1.Rows.Count > 0)
                            { %>
                             
                        <asp:GridView ID="gridview1" runat="server" AutoGenerateColumns="False" DataKeyNames="pid"
                            CssClass="mydatagrid" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                            OnRowEditing="gridview1_RowEditing1"
                            OnRowCancelingEdit="gridview1_RowCancelingEdit"
                            OnRowUpdating="gridview1_RowUpdating"
                            OnRowDeleting="gridview1_RowDeleting" AllowSorting="True" CellPadding="3" Height="380px" Width="878px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">



                            <Columns>



                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" Text='<%# Eval("pname") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" Text='<%# Eval("pname") %>' runat="server" Height="35" Width="175" />
                                    </EditItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Catagery">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" Text='<%# Eval("category") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="txtcatagory" runat="server" DataTextField="category" CssClass="form-control" Height="35" Width="175">

                                             <asp:ListItem>Garlic Pizza</asp:ListItem>
                                <asp:ListItem>Mushrooms Pizza</asp:ListItem>
                                <asp:ListItem>Onions Pizza</asp:ListItem>
                                <asp:ListItem>Chicken Pizza</asp:ListItem>
                                <asp:ListItem>Pepperoni Pizza</asp:ListItem>  

                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="txtcatagory" Text='<%# Eval("catagory") %>' runat="server" />--%>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" Text='<%# Eval("price") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtprice" Text='<%# Eval("price") %>' runat="server" Height="35" Width="175" />
                                    </EditItemTemplate>

                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="img" ImageUrl='<%#"../"+Eval("img") %>' Height="40px" Width="50px" />
                                        <%--<asp:Label ID="Label4" Text='<%# Eval("image") %>' runat="server"  />--%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="txtimage" runat="server" CssClass="form-control" Height="50" Width="175" BorderColor="#993333" BorderWidth="2" /></label><br />
                                        <%--<asp:TextBox ID="txtimage" Text='<%# Eval("image") %>' runat="server" />--%>
                                    </EditItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit ">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="../images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="25px" Height="25px" CssClass="pointertoimage" />
                                        <asp:ImageButton ID="ImageButton2" ImageUrl="../images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="25px" Height="25px" CssClass="pointertoimage" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton3" ImageUrl="../images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="25px" Height="25px" CssClass="pointertoimage" />
                                        <asp:ImageButton ID="ImageButton4" ImageUrl="../images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="25px" Height="25px" CssClass="pointertoimage" />
                                    </EditItemTemplate>

                                </asp:TemplateField>
                            </Columns>

                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                            <HeaderStyle BackColor="#A55129" CssClass="header" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" CssClass="pager" ForeColor="#8C4510"></PagerStyle>

                            <RowStyle BackColor="#FFF7E7" CssClass="rows" ForeColor="#8C4510"></RowStyle>

                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#FFF1D4"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#B95C30"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#F1E5CE"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#93451F"></SortedDescendingHeaderStyle>
                    </asp:GridView>


                        <%}
                  
                   else
                   {%>
                        <h2>No Menu Avaliable</h2>
                   <%}%>

                        <asp:SqlDataSource ID="search_all" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnectionString %>' SelectCommand="SELECT * FROM [items_tb]">
                        </asp:SqlDataSource>


                    
       

                    </div>
                 <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />







                        <br />
                    <br />







                        </div>
                    </div>
        </div>
                        </div>
                    </div>
                </div>
        <br />
        <br />
    </section>
        </div>
</asp:Content>

