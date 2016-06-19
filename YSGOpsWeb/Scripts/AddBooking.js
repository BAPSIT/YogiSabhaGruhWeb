$(document).ready(function () {
    $(".datepicker").datepicker({
        format: 'mm/dd/yyyy'
    });
    $(".timepicker").timepicker();

    
    $("#ContentPlaceHolder1_inpExtraHourCharges,#ContentPlaceHolder1_inpDiscount").change(updateBookingAmount);
    updateBookingAmount();
});

function updateBookingAmount() {
    console.log("update booking calling..");
    var hallCharges = +$("#ContentPlaceHolder1_hdnHallCharges").val();
    var extraHourCharges = +$("#ContentPlaceHolder1_inpExtraHourCharges").val();
    var discount = +$("#ContentPlaceHolder1_inpDiscount").val();
    var facilityAmount = +$("#ContentPlaceHolder1_lblFacilityTotal").text();
    facilityAmount = (facilityAmount == null || facilityAmount == undefined || facilityAmount == 'NaN' || facilityAmount == '') ? 0 : facilityAmount;

    $("#ContentPlaceHolder1_inpBookingFinal").val(hallCharges + facilityAmount + extraHourCharges - discount);
}

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
    console.log("calculated");
}

function MathRound(number) {
    return Math.round(number * 100) / 100;
}