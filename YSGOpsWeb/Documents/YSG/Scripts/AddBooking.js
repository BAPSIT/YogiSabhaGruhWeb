$(document).ready(function () {
    $(".datepicker").datepicker({
        format: 'mm/dd/yyyy'
    });
    $(".timepicker").timepicker();


    registerHandlers();
    updateBookingAmount();
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(calcFacilityTotal);
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(updateBookingAmount);
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(registerHandlers);
    


});
function registerHandlers() {
    $("#ContentPlaceHolder1_inpExtraHourCharges,#ContentPlaceHolder1_inpDiscount,#ContentPlaceHolder1_inpPaidAmt").change(updateBookingAmount);
}

function updateBookingAmount() {
    console.log("update booking calling..");
    var hallCharges = +$("#ContentPlaceHolder1_hdnHallCharges").val();
    var extraHourCharges = +$("#ContentPlaceHolder1_inpExtraHourCharges").val();
    var discount = +$("#ContentPlaceHolder1_inpDiscount").val();
    var facilityAmount = +$("#ContentPlaceHolder1_lblFacilityTotal").text();
    facilityAmount = (facilityAmount == null || facilityAmount == undefined || facilityAmount == 'NaN' || facilityAmount == '') ? 0 : facilityAmount;
    var paidAmount = +$("#ContentPlaceHolder1_inpPaidAmt").val();
    var finalBookingAmnt = hallCharges + facilityAmount + extraHourCharges - discount;
    $("#ContentPlaceHolder1_inpBookingFinal").val(finalBookingAmnt);
    $("#ContentPlaceHolder1_inpAmountPayable").val(finalBookingAmnt - paidAmount);
}

function CalAmount(requiredQuantity) {
    var gridRow = requiredQuantity.parentNode.parentNode;

    var inputs = gridRow.getElementsByTagName("input");
    var spans = gridRow.getElementsByTagName("span");
    var rate;
    var amount;

    var availableQty = +$(requiredQuantity).data("maxvalue");
    if (availableQty < +requiredQuantity.value) {
        requiredQuantity.value = 0;
    }

    for (var i = 0; i < spans.length; i++) {
        if (spans[i].id.indexOf("lblRatePerQty") != -1) {
            rate = spans[i].innerHTML;
        }
    }
    amount = requiredQuantity.value * rate;

    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].id.indexOf("txtAmount") != -1) {
            inputs[i].value = amount;
        }
    }
}

function calcFacilityTotal() {
    var txtTotal = 0.00;

    $(".calcAmt").each(function (index, value) {

        var val = value.value;
        if (val != null && val != undefined && val != '') {
            val = val.replace(",", ".");
            txtTotal = MathRound(parseFloat(txtTotal) + parseFloat(val));
        }
    });

    document.getElementById("ContentPlaceHolder1_lblFacilityTotal").innerText = txtTotal.toFixed(2);
    
}

function MathRound(number) {
    return Math.round(number * 100) / 100;
}

$(function () {
    $("#tblFacility").jqGrid({
        datatype: function (pdata) { getData(pdata); },
        //height: 250,
        colNames: ['Item', 'Available Qty', 'Rate Per Qty', 'Required Qty', 'Amount', 'Remarks'],
        colModel: [
               { name: 'InventoryInfo.Item_name', width: 350, sortable: false },
               { name: 'InventoryInfo.Available_Qty', width: 100, sortable: false },
               { name: 'InventoryInfo.Rent_per_Qty', width: 100, sortable: false },
               { name: 'Required_Qty', width: 100, sortable: false, editable: true },
               { name: 'Calculated_Amount', width: 120, sortable: false, editable: true },
               { name: 'Remarks', width: 350, sortable: false, editable: true },
               //{ name: 'Action', width: 200, sortable: false }
        ],
        'cellEdit': true,
        //imgpath: '<%= ResolveClientUrl("~/styles/redmon/images") %>',
        // caption: "Facilities"
    });
    $.ajax({
        type: 'GET',
        contentType: "application/json; charset=utf-8",
        url: '/api/booking/GetBookingFacilities/?bookingNo=0',
        //data: '{}',
        dataType: "json",
        success: function (data, textStatus) {
            if (textStatus == "success")
                //ReceivedClientData(JSON.parse(getMain(data)).rows);

                ReceivedClientData(data);
        },
        error: function (data, textStatus) {
            alert('An error has occured retrieving data!');
        }
    });
});
function ReceivedClientData(data) {
    var thegrid = $("#tblFacility");
    thegrid.clearGridData();
    for (var i = 0; i < data.length; i++)
        thegrid.addRowData(i + 1, data[i]);
}
function getMain(dObj) {
    if (dObj.hasOwnProperty('d'))
        return dObj.d;
    else
        return dObj;
}

