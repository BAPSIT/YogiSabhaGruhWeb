<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.UserDetails" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>User Details</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gvUserList" CssClass="table " runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="false">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Full Name">
                <ItemStyle Width="200px" />
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("User_Name") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Login ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" Text='<%# Eval("user_login_id") %>' runat="server"></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Mobile_No") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email ID">
                <ItemTemplate>
                    <asp:Label ID="Label2" Text='<%# Eval("Email_id") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "/pages/User_Master.aspx?userNo="+Eval("user_no") %>'>Edit</asp:HyperLink>
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

    <asp:HyperLink CssClass="btn btn-default" runat="server" NavigateUrl="/pages/User_Master.aspx"> Add new user</asp:HyperLink>
    
</asp:Content>
