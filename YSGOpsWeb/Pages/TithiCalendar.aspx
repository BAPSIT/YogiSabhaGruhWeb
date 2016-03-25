<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TithiCalendar.aspx.cs"
    Inherits="YSGOpsWeb.Pages.TithiCalendar" MasterPageFile="~/Master/YSGWeb.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="panel panel-default">
        <div class="panel-heading">Upload Tithi CSV File</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label>Choose File:</label>
                        <asp:FileUpload ID="flUpTithi" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <p>Click on the button below to download the current tithi information</p>
                        <asp:Button Text="Download Current Data" CssClass="btn btn-default" runat="server" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

