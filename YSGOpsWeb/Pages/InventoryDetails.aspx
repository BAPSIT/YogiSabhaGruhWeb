<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryDetails.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.InventoryDetails" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Inventory Details</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gvInventoryList" CssClass="table " runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="false">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Item Name">
                <ItemStyle Width="200px"  />
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Item_Name") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Available Qty">
                <ItemTemplate>
                    <asp:Label ID="Label1" Text='<%# Eval("Available_Qty") %>' runat="server"></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rent Per Qty">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Rent_per_Qty") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "/pages/InventoryForm.aspx?InventoryID="+Eval("Item_no") %>'>Edit</asp:HyperLink>
                    <asp:LinkButton runat="server" OnClientClick='return ConfirmDelete()'  CommandArgument='<%# Eval("Item_no") %>' OnClick="Unnamed_Click">Delete</asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#F3EFEE" ForeColor="Black" HorizontalAlign="Center" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>

    <asp:HyperLink CssClass="btn btn-default" runat="server" NavigateUrl="/pages/inventoryform.aspx"> Add new inventory</asp:HyperLink>
    <script>
        function ConfirmDelete() {
            if (confirm("Are you sure you want to delete this inventory?")) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
