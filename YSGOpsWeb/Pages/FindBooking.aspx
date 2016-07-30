<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindBooking.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.FindBooking" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="../Content/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" />
    <link href="../Content/ui.jqgrid.css" rel="stylesheet" />
    <link href="../Content/bootstrap-timepicker.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
   
    <%--    <link href="../Content/bootstrap.min.css" rel="stylesheet" />--%>
   
    <%--    <script src="../Scripts/bootstrap.min.js"></script>--%>
  <%--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({
                format: 'dd/mm/yyyy'
            });
            //$("#inpBookingFromDate").datepicker();
        });

        $(function () {
            $("[id*=grdList] [id*=btnEdit]").click(function () {
                $("[id*=lblEmpId]").html($(".EmpId", $(this).closest("tr")).html());
                $('#<%=hdnBookingNo.ClientID%>').val(id);
            });
        });
    </script>
    <style type="text/css">
        .alertNote {
            color: #ff0000;
            background: rgba(255,0,0,.1);
            border: solid 1px #ff0000;
            font-size: 14px;
            padding: 5px 10px;
        }
    </style>
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
                        <asp:RequiredFieldValidator ValidationGroup="search" ID="rfvBookingDate" runat="server" CssClass="text-danger" ErrorMessage="Booking Date is compulsory" ControlToValidate="inpBookingFromDate"></asp:RequiredFieldValidator>
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingTo">To Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingToDate" placeholder="Booking Date" />
                        <asp:RequiredFieldValidator ValidationGroup="search" SetFocusOnError="True" ID="rfvTo" runat="server" CssClass="text-danger" ErrorMessage="To is compulsory" ControlToValidate="inpBookingToDate"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-1 col-sm-2">
                    <asp:Button Text="Search" ID="btnSearch" ValidationGroup="search" OnClientClick="Page_ClientValidate()" CssClass="btn btn-primary" OnClick="btnSearch_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
    </div>

    <div style="text-align: center" runat="server" id="msg" visible="false">
        <span class="alertNote">Booking Cancelled Successfully</span>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Booking Information</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <p>
                            Booking Status Legends: I - Inquiry / F - Confirmed / C - Cancelled / R - Refused / M - Completed
                        </p>
                        <asp:GridView OnRowDataBound="grdList_RowDataBound" ID="grdList" runat="server" EmptyDataText="No Booking Available" AutoGenerateColumns="false" Width="98%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:linkbutton id="btnEdit" text="Cancel" runat="server" class="btn btn-info btn-lg"  data-toggle="modal" data-target="#myModal" xmlns:asp="#unknown" />
                                    </ItemTemplate>
                                    <ItemStyle Width="15px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Booking No" DataField="Booking_No" />
                                <asp:BoundField HeaderText="Booking ID" DataField="Booking_ID" />
                                <asp:BoundField HeaderText="Booking Date" DataField="Booking_Date" />
                                <asp:BoundField HeaderText="From Time" DataField="Booking_FromTime" />
                                <asp:BoundField HeaderText="To Time" DataField="Booking_ToTime" />
                                <asp:BoundField HeaderText="Customer Name" DataField="Customer_name" />
                                <asp:BoundField HeaderText="Mobile No" DataField="Mobile_No" />
                                <asp:BoundField HeaderText="Booking Status" DataField="Booking_Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <!-- Modal -->
    <div id="myModal" class="modal fade in" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Cancellation</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="form-inline">
                                <label for="inpReason">Reason</label><span class="text-danger">*</span>
                                <input type="text" runat="server" class="form-control" id="inpReason" placeholder="Reason" />
                                <asp:RequiredFieldValidator ValidationGroup="save" ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="Reason is compulsory" ControlToValidate="inpReason"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="form-inline">
                                <label for="inpDescription">Description</label><span class="text-danger">*</span>
                                <input type="text" runat="server" class="form-control" id="inpDescription" placeholder="Description" />
                                <asp:RequiredFieldValidator ValidationGroup="save" ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Description is compulsory" ControlToValidate="inpDescription"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="form-inline">
                                <label for="inpAmountRefunded">Amount Refunded</label><span class="text-danger">*</span>
                                <input type="text" runat="server" class="form-control bfh-number" id="inpAmountRefunded" placeholder="Amount Refunded" />
                                <asp:RequiredFieldValidator ValidationGroup="save" ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="Amount refunded is compulsory" ControlToValidate="inpAmountRefunded"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="form-inline">
                                <label for="inpCancellationdate">Cancellation Date</label><span class="text-danger">*</span>
                                <input type="text" runat="server" class="form-control datepicker" id="inpCancellationdate" placeholder="Cancellation Date" />
                                <asp:RequiredFieldValidator ValidationGroup="save" SetFocusOnError="True" ID="rfvFrom" runat="server" CssClass="text-danger" ErrorMessage="Cancellation date is compulsory" ControlToValidate="inpCancellationdate"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Back to booking</button>
                    <asp:Button Text="Cancel Booking" ID="btnSave" OnClick="btnSave_Click" ValidationGroup="save" CssClass="btn btn-danger" runat="server" />
                </div>
            </div>

        </div>
    </div>

    <!--Hidden Fields-->
    <asp:HiddenField ID="hdnBookingStatus" Value="I" runat="server" />
    <asp:HiddenField ID="hdnBookingNo" Value="-1" runat="server" />
    <asp:HiddenField ID="hdnBookingId" Value="-1" runat="server" />
    <asp:HiddenField ID="hdnBookingAction" Value="-1" runat="server" />
    <script>   
        function setHiddenFields(bookingNo, bookingId) {

            $("#ContentPlaceHolder1_hdnBookingNo").val(bookingNo);
            $("#ContentPlaceHolder1_hdnBookingId").val(bookingId);
        }

    </script>
</asp:Content>
