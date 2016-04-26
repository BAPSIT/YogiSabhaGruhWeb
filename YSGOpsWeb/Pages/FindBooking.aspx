<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindBooking.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.FindBooking" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="../Content/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" />
    <link href="../Content/ui.jqgrid.css" rel="stylesheet" />
    <link href="../Content/bootstrap-timepicker.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../Scripts/bootstrap-timepicker.js"></script>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({
                format: 'dd/mm/yyyy'
            });
            //$("#inpBookingFromDate").datepicker();
        });

    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="panel panel-default">
        <div class="panel-heading">Search Booking</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingDate">Booking From Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingFromDate" placeholder="Booking Date" />
                        <asp:RequiredFieldValidator ID="rfvBookingDate" runat="server" CssClass="text-danger" ErrorMessage="Booking Date is compulsory" ControlToValidate="inpBookingFromDate"></asp:RequiredFieldValidator>
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingTo">To Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingToDate" placeholder="Booking Date" />
                        <asp:RequiredFieldValidator SetFocusOnError="True" ID="rfvTo" runat="server" CssClass="text-danger" ErrorMessage="To is compulsory" ControlToValidate="inpBookingToDate"></asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-1 col-sm-2">
            <asp:Button Text="Search" ID="btnSearch" OnClientClick="Page_ClientValidate()" CssClass="btn btn-primary" OnClick="btnSearch_Click" runat="server" />
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Booking Information</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <asp:GridView ID="grdList" runat="server" EmptyDataText="No Booking Available"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--Hidden Fields-->
    <asp:HiddenField ID="hdnBookingStatus" Value="I" runat="server" />
    <asp:HiddenField ID="hdnBookingId" Value="-1" runat="server" />
    <asp:HiddenField ID="hdnBookingAction" Value="-1" runat="server" />
</asp:Content>
