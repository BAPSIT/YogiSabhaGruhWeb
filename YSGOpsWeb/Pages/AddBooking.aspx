<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" MasterPageFile="~/Master/YSGWeb.Master" Inherits="YSGOpsWeb.Pages.AddBooking" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="../Content/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" />
    <link href="../Content/ui.jqgrid.css" rel="stylesheet" />
    <link href="../Content/bootstrap-timepicker.css" rel="stylesheet" />
    <link href="../Content/cupertino/jquery-ui.min.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../Scripts/bootstrap-timepicker.js"></script>
    <script src="../Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../Scripts/jquery.jqGrid.min.js"></script>
    <script src="../Scripts/AddBooking.js"></script>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="panel panel-default">

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:Panel runat="server" Visible="false" ID="pnlMessage">
            <div class="alert alert-danger">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </asp:Panel>

        <div class="panel-heading">Event Info</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">

                    <div class="form-inline">
                        <label>Booking ID</label>
                        <input type="text" runat="server" class="form-control" id="inpBookingID" placeholder="Booking ID" readonly="true" /><br />
                        &nbsp;
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Booking Status</label>
                        <input type="text" runat="server" class="form-control" id="inpBookingStatus" placeholder="Booking Status" readonly="true" /><br />
                        &nbsp;
                    </div>
                </div>


            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingDate">Booking Date</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control datepicker" id="inpBookingDate" placeholder="Booking Date" />
                        <asp:RequiredFieldValidator ID="rfvBookingDate" runat="server" CssClass="text-danger" ErrorMessage="Booking Date is compulsory" ControlToValidate="inpBookingDate"></asp:RequiredFieldValidator>
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingFrom">From</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control timepicker" id="inpBookingFrom" placeholder="From" />
                        <asp:RequiredFieldValidator SetFocusOnError="True" ID="rfvFrom" runat="server" CssClass="text-danger" ErrorMessage="From is compulsory" ControlToValidate="inpBookingFrom"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingTo">To</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control timepicker" id="inpBookingTo" placeholder="To" />
                        <asp:RequiredFieldValidator SetFocusOnError="True" ID="rfvTo" runat="server" CssClass="text-danger" ErrorMessage="To is compulsory" ControlToValidate="inpBookingTo"></asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Type Of Event</label>
                        <asp:DropDownList CssClass="form-control" ID="ddlEventType" runat="server">
                            <asp:ListItem Value="1">Mandir Event</asp:ListItem>
                            <asp:ListItem Value="2">Charitable</asp:ListItem>
                            <asp:ListItem Value="3">Prarthna Sabha</asp:ListItem>
                            <asp:ListItem Value="4">Educational</asp:ListItem>
                            <asp:ListItem Value="5">Political</asp:ListItem>
                            <asp:ListItem Value="6">Other</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label>Category Event</label>
                        <asp:DropDownList CssClass="form-control" ID="ddlEventCategory" runat="server">
                            <asp:ListItem Value="A">A</asp:ListItem>
                            <asp:ListItem Value="B">B </asp:ListItem>
                            <asp:ListItem Value="C">C</asp:ListItem>
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
                    <div class="form-inline">
                        <label for="inpName">Customer Name</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpName" placeholder="Name" />
                        <asp:RequiredFieldValidator SetFocusOnError="True" ID="rfvCustomerName" runat="server" CssClass="text-danger" ErrorMessage="Customer Name is compulsory" ControlToValidate="inpName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpPrimaryPhone">Phone Number</label><span class="text-danger">*</span>
                        <input type="text" runat="server" class="form-control" id="inpPrimaryPhone" placeholder="Mobile Number" />
                        <asp:RequiredFieldValidator SetFocusOnError="True" ID="rfvPhone" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Phone Number is compulsory" ControlToValidate="inpPrimaryPhone"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="inpPrimaryPhone" CssClass="text-danger" ValidationExpression="\d{10}" Display="Dynamic" ErrorMessage="Phone number should of 10 digits only"></asp:RegularExpressionValidator>
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
                        <textarea runat="server" class="form-control" id="textAreaAddress" cols="30" rows="4"></textarea>
                        <br />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-inline">
                        <label>Remarks </label>
                        <textarea id="inpRemarks" runat="server" rows="4" cols="30" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
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
                        <asp:DropDownList CssClass="form-control" ID="ddlHall" runat="server">
                            <asp:ListItem Value="1">Yogi Mandapam</asp:ListItem>
                            <asp:ListItem Value="2">Yogi Hall </asp:ListItem>
                            <asp:ListItem Value="3">Yogi Hall + Balcony</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpGuests"># of Guests</label>
                        <input type="text" runat="server" class="form-control" id="inpNGuests" value="0" placeholder="No. of Guests" />
                        <asp:RegularExpressionValidator ID="rfvGuests" runat="server" ControlToValidate="inpNGuests" CssClass="text-danger" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="# of Guests should be a number"></asp:RegularExpressionValidator>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Event Facilities</div>
        <div class="panel-body">
            <div class="row">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <p>
                                <%--<table id="tblFacility" cellpadding="0" cellspacing="0">
                        </table>--%>
                                <asp:GridView ID="gridFacilty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowHeaderWhenEmpty="True" ForeColor="Black" GridLines="Vertical" ShowFooter="true">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InventoryInfo.Item_no")%>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblItemNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InventoryInfo.Item_no")%>' Visible="false"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InventoryInfo.Item_name")%>'></asp:Label>
                                            </ItemTemplate>

                                            <FooterTemplate>
                                                <%--<asp:DropDownList CssClass="form-control" ID="ddlFacility" runat="server">
                                            <asp:ListItem Value="5">Plastic Chairs</asp:ListItem>
                                            <asp:ListItem Value="102">Food Packets</asp:ListItem>
                                            <asp:ListItem Value="103">Others - 1</asp:ListItem>
                                            <asp:ListItem Value="104">Others - 2</asp:ListItem>
                                            <asp:ListItem Value="105">Others -3</asp:ListItem>
                                        </asp:DropDownList>--%>
                                                <asp:DropDownList CssClass="form-control" ID="ddlFacility" runat="server">
                                                </asp:DropDownList>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Available Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAvailableQty" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InventoryInfo.Available_Qty")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rate Per Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRatePerQty" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InventoryInfo.Rent_per_Qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Required Qty">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRequiredQty" runat="server" onchange="CalAmount(this)" Text='<%# DataBinder.Eval(Container.DataItem, "Required_Qty") %>' TextMode="Number" MaxLength="6"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtRequiredQty" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Required_Qty") %>' TextMode="Number" MaxLength="6"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAmount" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Calculated_Amount") %>' TextMode="Number" MaxLength="10"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtAmount" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Calculated_Amount") %>' TextMode="Number" MaxLength="10"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#F3EFEE" />
                                    <HeaderStyle BackColor="#F3EFEE" Font-Bold="True" ForeColor="Black" />
                                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                            </p>

                            <div class="">
                                <asp:Button ID="btnAddFacility" runat="server" Text="Add Other Facility" OnClick="btnAddFacility_Click" CausesValidation="False" />

                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddFacility" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
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
                        <input type="text" runat="server" value="0" class="form-control" id="inpBookingFinal" />
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">

                        <label for="inpBookingFinal">Discount</label>
                        <input type="text" runat="server" value="0" class="form-control" id="inpDiscount" /><br />
                        <asp:RegularExpressionValidator ID="rfvDiscount" runat="server" ControlToValidate="inpDiscount" CssClass="text-danger" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="Discount should be a number"></asp:RegularExpressionValidator>

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
                        <label>Paid Amount</label>
                        <input type="text" runat="server" class="form-control" id="inpPaidAmt" value="0" /><br />
                        <asp:RegularExpressionValidator ID="rfvPaidAmount" runat="server" ControlToValidate="inpPaidAmt" CssClass="text-danger" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="Amount should be a number"></asp:RegularExpressionValidator>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2">
            <asp:Button Text="Save" ID="btnSave" OnClientClick="Page_ClientValidate()" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" />
        </div>
        <div class="col-md-2 col-sm-2">
            <asp:Button Text="Confirm Booking" CssClass="btn btn-success" ID="btnConfirmBooking" OnClick="btnConfirmBooking_Click" runat="server" />
        </div>
        <div class="col-md-2 col-sm-2">
            <asp:Button Text="Cancel" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-warning" runat="server" Visible="false" />
        </div>

        <div class="col-md-2 col-sm-2">
            <asp:Button Text="Cancel Booking" CssClass="btn btn-danger" ID="btnCancelBooking" OnClick="btnCancelBooking_Click" runat="server" Visible="false" />
        </div>

    </div>
    <!--Hidden Fields-->
    <asp:HiddenField ID="hdnBookingStatus" Value="I" runat="server" />
    <asp:HiddenField ID="hdnBookingId" Value="-1" runat="server" />
    <asp:HiddenField ID="hdnBookingAction" Value="-1" runat="server" />
    <asp:HiddenField ID="hdnBookingNo" Value="0" runat="server" />
    <asp:HiddenField ID="hdnCustomerNo" Value="-1" runat="server" />

    <script type="text/javascript">
        function CalAmount(requiredQuantity) {
            var gridRow = requiredQuantity.parentNode.parentNode;

            var inputs = gridRow.getElementsByTagName("input");
            var spans = gridRow.getElementsByTagName("span");
            var rate;
            var amount;

            for (var i = 0; i < spans.length; i++) {
                if (spans[i].id.indexOf("lblRatePerQty") != -1) {
                    rate = spans[i].innerHTML;
                }
            }
            amount = requiredQuantity.value * rate;

            gridRow.cells[4].innerText = amount;
        }

    </script>

</asp:Content>


