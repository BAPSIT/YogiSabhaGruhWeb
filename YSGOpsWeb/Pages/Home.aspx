<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="YSGOpsWeb.Pages.Home" MasterPageFile="~/Master/YSGWeb.Master" %>

<asp:Content runat="server" ID="Body" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div id="calendar"></div>
        </div>
    </div>

</asp:Content>
<asp:Content runat="server" ID="Head" ContentPlaceHolderID="head">
    <link href="../Content/fullcalendar.css" rel="stylesheet" />
    <%--<link href="../Content/fullcalendar.print.css" rel="stylesheet" />--%>
    <link href="../Content/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <script src="../Scripts/moment.min.js"></script>
    <script src="../Scripts/fullcalendar.min.js"></script>
    <link href="../Content/bootstrap-fullcalendar.css" rel="stylesheet" />
    <script>
        var tithiObj = {};
        $(document).ready(function () {
            function initializeCalendar() {
                $("#calendar").fullCalendar({
                    "header": {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,basicWeek,basicDay'
                    },
                    // theme: true,
                    dayRender: function (date, cell) {
                        if (tithiObj[date.format("YYYY-MM-DD")]) {
                            cell[0].innerHTML = tithiObj[date.format("YYYY-MM-DD")];
                        }
                    },

                });
            }


            $.ajax({
                url: "/api/tithi/GetTithiFor/?from=" + moment().month(0).date(1).format("YYYY-MM-DD") + "&to=" + moment().month(11).date(31).format("YYYY-MM-DD"),
                method: "GET",
                dataType: "json",
                cache: true,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var obj = data[i],
                            date = data[i]["Tithi_Date"];
                        date = date.split("T")[0];

                        tithiObj[date] = data[i].TithiName + " " + data[i].Description;
                    }
                    initializeCalendar();
                },
                error: function () {
                    initializeCalendar();
                }

            });

        });
    </script>
    <style>
        #calendar {
            max-width: 900px;
            width: 900px;
            margin: 0 auto;
        }
    </style>
    <script>
         
    </script>
</asp:Content>
