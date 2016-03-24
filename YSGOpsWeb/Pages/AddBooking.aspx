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
                    <div class="form-group">
                        <label for="inpBookingDate">Booking Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingDate" placeholder="Booking Date" />
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="inpBookingFrom">From</label><span class="text-danger">*</span>
                        <input type="text" class="form-control timepicker" id="inpBookingFrom" placeholder="From" />
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="inpBookingTo">To</label><span class="text-danger">*</span>
                        <input type="text" class="form-control timepicker" id="inpBookingTo" placeholder="To" />
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label>Type Of Event</label>
                        <asp:DropDownList CssClass="form-control" ID="ddlEventType" runat="server">
                            <asp:ListItem Value="">Charitable</asp:ListItem>
                            <asp:ListItem Value="">Prarthna Sabha</asp:ListItem>
                            <asp:ListItem Value="">Educational</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label>Category Event</label>
                        <asp:DropDownList CssClass="form-control" ID="ddlEventCategory" runat="server">
                            <asp:ListItem Value="">A</asp:ListItem>
                            <asp:ListItem Value="">B </asp:ListItem>
                            <asp:ListItem Value="">C</asp:ListItem>
                        </asp:DropDownList>

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
                    <div class="form-group">
                        <label for="inpName">Customer Name</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpName" placeholder="Name" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="inpPrimaryPhone">Phone Number</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpPrimaryPhone" placeholder="Mobile Number" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="inpEmail">Email Id</label>
                        <input type="text" runat="server" class="form-control" id="inpEmail" placeholder="someone@example.com" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
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
                    <div class="form-group">
                        <label>Hall </label>
                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                            <asp:ListItem Value="">Yogi Mandapam</asp:ListItem>
                            <asp:ListItem Value="">Yogi Hall </asp:ListItem>
                            <asp:ListItem Value="">Yogi Hall + Balcony</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-group">
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
    <div class="row">
        <div class="col-md-1 col-sm-2">
            <button class="btn btn-primary" type="button">Save</button>
        </div>
        <div class="col-md-1 col-sm-2">
            <button class="btn btn-warning" type="button">Cancel</button>
        </div>

        <div class="col-md-1 col-sm-2">
            <button class="btn btn-success" type="button">CONFIRM BOOKING</button>
        </div>

    </div>
</asp:Content>
