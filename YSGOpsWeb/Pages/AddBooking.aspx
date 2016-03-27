<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.AddBooking" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="../Content/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-timepicker.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../Scripts/bootstrap-timepicker.js"></script>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({
                format: 'dd/mm/yyyy'
            });
            $(".timepicker").timepicker();
        });

    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="panel panel-default">
        <div class="panel-heading">Event Info</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingDate">Booking Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingDate" placeholder="Booking Date" />
                        <asp:requiredfieldvalidator setfocusonerror="True" id="rfvBookingDate" runat="server" cssclass="text-danger" errormessage="Booking Date is compulsory" controltovalidate="inpBookingDate"></asp:requiredfieldvalidator>
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingFrom">From</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control timepicker" id="inpBookingFrom" placeholder="From" />
                        <asp:requiredfieldvalidator setfocusonerror="True" id="rfvFrom" runat="server" cssclass="text-danger" errormessage="From is compulsory" controltovalidate="inpBookingFrom"></asp:requiredfieldvalidator>
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingTo">To</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control timepicker" id="inpBookingTo" placeholder="To" />
                        <asp:requiredfieldvalidator setfocusonerror="True" id="rfvTo" runat="server" cssclass="text-danger" errormessage="To is compulsory" controltovalidate="inpBookingTo"></asp:requiredfieldvalidator>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Type Of Event</label>
                        <asp:dropdownlist cssclass="form-control" id="ddlEventType" runat="server">
                            <asp:ListItem Value="">Charitable</asp:ListItem>
                            <asp:ListItem Value="">Prarthna Sabha</asp:ListItem>
                            <asp:ListItem Value="">Educational</asp:ListItem>
                        </asp:dropdownlist>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Category Event</label>
                        <asp:dropdownlist cssclass="form-control" id="ddlEventCategory" runat="server">
                            <asp:ListItem Value="">A</asp:ListItem>
                            <asp:ListItem Value="">B </asp:ListItem>
                            <asp:ListItem Value="">C</asp:ListItem>
                        </asp:dropdownlist>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Customer Information</div>
        <div class="panel-body">

            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpName">Customer Name</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpName" placeholder="Name" />
                        <asp:requiredfieldvalidator setfocusonerror="True" id="rfvCustomerName" runat="server" cssclass="text-danger" errormessage="Customer Name is compulsory" controltovalidate="inpName"></asp:requiredfieldvalidator>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpPrimaryPhone">Phone Number</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpPrimaryPhone" placeholder="Mobile Number" />
                        <asp:requiredfieldvalidator setfocusonerror="True" id="rfvPhone" runat="server" cssclass="text-danger" display="Dynamic" errormessage="Phone Number is compulsory" controltovalidate="inpPrimaryPhone"></asp:requiredfieldvalidator>
                        <asp:regularexpressionvalidator runat="server" controltovalidate="inpPrimaryPhone" cssclass="text-danger" validationexpression="\d{10}" display="Dynamic" errormessage="Phone number should of 10 digits only"></asp:regularexpressionvalidator>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpEmail">Email Id</label>
                        <input type="text" runat="server" class="form-control" id="inpEmail" placeholder="someone@example.com" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-inline">
                        <label for="inpEmail">Address</label>
                        <textarea runat="server" class="form-control" id="textAreaAddress" cols="20" rows="4"></textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Event Requirements</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Hall </label>
                        <asp:dropdownlist cssclass="form-control" id="DropDownList1" runat="server">
                            <asp:ListItem Value="">Yogi Mandapam</asp:ListItem>
                            <asp:ListItem Value="">Yogi Hall </asp:ListItem>
                            <asp:ListItem Value="">Yogi Hall + Balcony</asp:ListItem>
                        </asp:dropdownlist>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpGuests"># of Guests</label>
                        <input type="text" runat="server" class="form-control" id="inpNGuests" placeholder="No. of Guests" />
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Event Facilities</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <p>
                        Event Facilities grid to come here 
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Payment Information</div>
        <div class="panel-body">

            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingFinal">Final Booking Amount</label>
                        <input type="text" runat="server" readonly="" class="form-control" id="inpBookingFinal" />
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">

                        <label for="inpBookingFinal">Discount</label>
                        <input type="text" runat="server" class="form-control" id="inpDiscount" />

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">

                        <label for="inpBookingFinal">Discount Reason</label>
                        <input type="text" runat="server" class="form-control" id="inpDiscountReason" />


                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-sm-2">
            <asp:button text="Save" id="btnSave" onclientclick="Page_ClientValidate()" cssclass="btn btn-primary" onclick="btnSave_Click" runat="server" />
        </div>
        <div class="col-md-1 col-sm-2">
            <asp:button text="Cancel" onclick="btnCancel_Click" id="btnCancel" cssclass="btn btn-warning" runat="server" />
        </div>

        <div class="col-md-1 col-sm-2">

            <asp:button text="Confirm Booking" cssclass="btn btn-success" id="btnConfirmBooking" onclick="btnConfirmBooking_Click" runat="server" />
            <asp:button text="Cancel Booking" cssclass="btn btn-danger" id="btnCancelBooking" onclick="btnCancelBooking_Click" runat="server" />
        </div>

    </div>
</asp:Content>
