<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Master.aspx.cs" Inherits="YSGOpsWeb.Pages.User_Master" MasterPageFile="~/Master/YSGWeb.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">Create User Account</div>
        <div class="panel-body">
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Name</label>
                        <br />
                        <input type="text" id="txtFullName" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="rfvItemName" ControlToValidate="txtFullName" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Choose your username</label>
                        <br />
                        <input type="text" id="txtUserId" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator2" ControlToValidate="txtUserId" runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Create a password</label>
                        <br />
                        <input type="password" id="txtPassword" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator3" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Confirm password</label>
                        <br />
                        <input type="password" id="txtRePassword" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator4" ControlToValidate="txtRePassword" runat="server" ErrorMessage="Please re-type password"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password & Confirm password don't match " ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ForeColor="#990000"></asp:CompareValidator>
                         </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Mobile phone</label>
                        <br />
                        <input type="text" id="txtMobileNumber" runat="server" /><br />
                        <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ID="RequiredFieldValidator1" ControlToValidate="txtMobileNumber" runat="server" ErrorMessage="Mobile phone is required"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Email </label>
&nbsp;<br />
                        <input type="email" id="txtEmail" runat="server" /><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter proper email" ControlToValidate="txtEmail" ForeColor="#990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <asp:Button ID="btnSave" CssClass="btn btn-default" OnClick="btnSave_Click" runat="server" Text="Save" />
            <asp:HyperLink ID="hypCancel" NavigateUrl="/pages/User_Master.aspx" CssClass="btn btn-default" runat="server" Text="Cancel" />
        </div>
    </div>
</asp:Content>
