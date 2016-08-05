<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HallMaster.aspx.cs" Inherits="YSGOpsWeb.Pages.HallMaster" MasterPageFile="~/Master/YSGWeb.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>Hall Master</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="panel panel-default">
        <div class="panel-heading">Hall Info</div>
        <div class="panel-body">
            <asp:GridView runat="server" ID="gvHallInfo" CssClass="table " runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Item Name">
                        <ItemStyle Width="200px" />
                        <ItemTemplate>
                            <asp:Label ID="lblHallName" Text='<%# Eval("Hall_Name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Capacity Seating">
                        <ItemStyle Width="200px" />
                        <ItemTemplate>
                            <asp:Label ID="lblCapacitySeating" Text='<%# Eval("Capacity_Seating") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Capacity Chairs">
                        <ItemStyle Width="200px" />
                        <ItemTemplate>
                            <asp:Label ID="lblCapacityChairs" Text='<%# Eval("Capacity_chairs") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rent Per Hour">
                        <ItemTemplate>
                            <asp:Label ID="lblRentPerHour" Text='<%# Eval("Rent_per_Hour") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "/pages/HallForm.aspx?HallID="+Eval("Hall_no") %>'>Edit</asp:HyperLink>
                    <asp:LinkButton ID="lnkButtonDelete" runat="server" OnClientClick='return ConfirmDelete()'  CommandArgument='<%# Eval("Hall_no") %>' OnClick="lnkButtonDelete_Click">Delete</asp:LinkButton>

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
        </div>
    </div>
    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-default" runat="server" NavigateUrl="/pages/HallFOrm.aspx"> Add new hall</asp:HyperLink>
    <script>
        function ConfirmDelete() {
            if (confirm("Are you sure you want to delete this inventory?")) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
