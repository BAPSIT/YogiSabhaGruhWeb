<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HallForm.aspx.cs" Inherits="YSGOpsWeb.Pages.HallForm" MasterPageFile="~/Master/YSGWeb.Master" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Inventory Form</title>
</asp:Content>
<asp:Content  runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
      <div class="panel panel-default">
        <div class="panel-heading">Inventory Info</div>
        <div class="panel-body">
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Hall Name</label>
                        <input type="text" id="txtHallName" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="rfvItemName" ControlToValidate="txtHallName" runat="server" ErrorMessage="Hall Name is required"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Capacity Seating</label>
                        <input type="text" id="txtCapacitySeating" value="0" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator1" ControlToValidate="txtCapacitySeating" runat="server" ErrorMessage="Capacity Seating is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic"  CssClass="text-danger" ID="revCapacitySeating" runat="server" ControlToValidate="txtCapacitySeating" ValidationExpression="\d+" ErrorMessage="Capacity Seating should be a number"></asp:RegularExpressionValidator>
                        <%--<asp:RangeValidator Display="Dynamic" CssClass="text-danger" ID="rvAvailableQty" ControlToValidate="txtAvailableQty" runat="server" MinimumValue="1" MaximumValue="10000000" ErrorMessage="Available quantity should be greater than 0"></asp:RangeValidator>--%>
                    </div>
                </div>
            </div>
             <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Capacity Chairs</label>
                        <input type="text" id="txtCapacityChairs" value="0" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator2" ControlToValidate="txtCapacityChairs" runat="server" ErrorMessage="Capacity Chairs is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic"  CssClass="text-danger" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCapacityChairs" ValidationExpression="\d+" ErrorMessage="Capacity Chairs should be a number"></asp:RegularExpressionValidator>
                        <%--<asp:RangeValidator Display="Dynamic" CssClass="text-danger" ID="rvAvailableQty" ControlToValidate="txtAvailableQty" runat="server" MinimumValue="1" MaximumValue="10000000" ErrorMessage="Available quantity should be greater than 0"></asp:RangeValidator>--%>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Rent Per Hour</label>
                        <input type="text" id="txtRentPerHour" value="0" runat="server" /><br />
                        <asp:RegularExpressionValidator Display="Dynamic" CssClass="text-danger" ID="rev" runat="server" ControlToValidate="txtRentPerHour" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="Rent Per Hour should be a number"></asp:RegularExpressionValidator>
                        <%--<asp:RangeValidator Display="Dynamic"  CssClass="text-danger" ID="revRPQ" ControlToValidate="txtRentPerQty" runat="server" MinimumValue="0.5" MaximumValue="10000000" ErrorMessage="Rent per quantity should be greater than 0.5"></asp:RangeValidator>--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <asp:Button ID="btnSave" CssClass="btn btn-default" Onclick="btnSave_Click" runat="server" Text="Save" />
            <asp:HyperLink ID="hypCancel" NavigateUrl="/pages/HallMaster.aspx" CssClass="btn btn-default" runat="server" Text="Cancel" />
        </div>
    </div>
</asp:Content>