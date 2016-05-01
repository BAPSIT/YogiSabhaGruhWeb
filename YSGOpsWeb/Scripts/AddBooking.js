$(document).ready(function () {
    $(".datepicker").datepicker({
        format: 'dd/mm/yyyy'
    });
    $(".timepicker").timepicker();
});

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
});

function getData(pData) {
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
}
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