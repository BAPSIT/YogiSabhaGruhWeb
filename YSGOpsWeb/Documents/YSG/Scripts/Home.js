

//pageLoad
onPageLoad();
function onPageLoad() {

    $(document).ready(function () {
        $(document).ready(function () {
            IntializeCalendar();
        });
    });
}


function IntializeCalendar() {

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        allDayDefault: false,
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,
        events: function (start, end, timezone, callback) {

            var selectedMonth = getMonth();

            $.ajax({

                url: "/api/booking/GetBookingByDate/?from=" + moment().month(selectedMonth - 1).date(1).format("YYYY-MM-DD") + "&to=" + moment().month(selectedMonth + 1).date(31).format("YYYY-MM-DD"),
                dataType: 'json',
                success: function (doc) {
                    var events = [];

                    doc.forEach(function (e) {
                        events.push({
                            title: e.Event_Class + ": " + e.EventDetails.Event_name,
                            start: e.Booking_FromTime,
                            end: e.Booking_ToTime,
                            //color: e.Booking_Status.toUpperCase() == "I" ? "#ff6600" : "#0F3CD1",
                            color: getEventColor(e.Booking_Status.toUpperCase()),
                            id: e.Booking_Id
                        });

                    });

                    callback(events);
                }
            });
        },

        eventClick: function (calEvent, jsEvent, view) {
            console.log(calEvent.title);
            var url = "AddBooking.aspx?booking_id=" + calEvent.id;
            $(location).attr('href', url);

        },

        dayClick: function (date, jsEvent, view) {
            var url = "AddBooking.aspx?date =" + date.format();

            $(location).attr('href', url);




        }
    });

}

function getMonth() {
    var date = new Date($('#calendar').fullCalendar('getDate'));
    return date.getMonth();
}

function getEventColor(status) {
    var colorCode = "";
    switch (status.toUpperCase()) {
        case 'I':
            colorCode = "#FF6600";
            break;
        case 'F':
            colorCode = "#0F3CD1";
            break;
        case 'C':
            colorCode = "#C2C2A3";
            break;
    
    }
    return colorCode;
}
