<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryForm.aspx.cs" Inherits="YSGOpsWeb.Pages.InventoryForm" MasterPageFile="~/Master/YSGWeb.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">Inventory Info</div>
        <div class="panel-body">
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Item Name</label>
                        <input type="text" id="txtItemName" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="rfvItemName" ControlToValidate="txtItemName" runat="server" ErrorMessage="Item Name is required"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Available Quantity</label>
                        <input type="text" id="txtAvailableQty" value="0" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator1" ControlToValidate="txtAvailableQty" runat="server" ErrorMessage="Available Quantity is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic"  CssClass="text-danger" ID="revAvailableQty" runat="server" ControlToValidate="txtAvailableQty" ValidationExpression="\d+" ErrorMessage="Available Quantity should be a number"></asp:RegularExpressionValidator>
                        <%--<asp:RangeValidator Display="Dynamic" CssClass="text-danger" ID="rvAvailableQty" ControlToValidate="txtAvailableQty" runat="server" MinimumValue="1" MaximumValue="10000000" ErrorMessage="Available quantity should be greater than 0"></asp:RangeValidator>--%>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Rent Per Quantity</label>
                        <input type="text" id="txtRentPerQty" value="0" runat="server" /><br />
                        <asp:RegularExpressionValidator Display="Dynamic" CssClass="text-danger" ID="rev" runat="server" ControlToValidate="txtRentPerQty" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="Rent Per Quantity should be a number"></asp:RegularExpressionValidator>
                        <%--<asp:RangeValidator Display="Dynamic"  CssClass="text-danger" ID="revRPQ" ControlToValidate="txtRentPerQty" runat="server" MinimumValue="0.5" MaximumValue="10000000" ErrorMessage="Rent per quantity should be greater than 0.5"></asp:RangeValidator>--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <asp:Button ID="btnSave" CssClass="btn btn-default" OnClick="btnSave_Click" runat="server" Text="Save" />
            <asp:HyperLink ID="hypCancel" NavigateUrl="/pages/InventoryDetails.aspx" CssClass="btn btn-default" runat="server" Text="Cancel" />
        </div>
    </div>
</asp:Content>
