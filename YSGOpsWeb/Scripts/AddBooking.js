$(document).ready(function () {
    $(".datepicker").datepicker({
        format: 'mm/dd/yyyy'
    });
    $(".timepicker").timepicker();

    $("#ContentPlaceHolder1_inpExtraHourCharges,#ContentPlaceHolder1_inpDiscount").change(updateBookingAmount);
    updateBookingAmount();
});

function updateBookingAmount() {
    var hallCharges = +$("#ContentPlaceHolder1_hdnHallCharges").val();
    var extraHourCharges = +$("#ContentPlaceHolder1_inpExtraHourCharges").val();
    var discount = +$("#ContentPlaceHolder1_inpDiscount").val();
    $("#ContentPlaceHolder1_inpBookingFinal").val(hallCharges + extraHourCharges - discount);
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