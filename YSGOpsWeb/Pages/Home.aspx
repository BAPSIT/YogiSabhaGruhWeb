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
        $(document).ready(function () {
            $("#calendar").fullCalendar({
                "header": {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                // theme: true,
                dayRender: function (date, cell) {
                    if (date.date() == 4) {
                        cell[0].innerHTML = " vad dasam";
                    }
                },
                events: [
				{
				    title: 'All Day Event',
				    start: '2016-01-01'
				},
				{
				    title: 'Long Event',
				    start: '2016-01-07',
				    end: '2016-01-10'
				},
				{
				    id: 999,
				    title: 'Repeating Event',
				    start: '2016-01-09T16:00:00'
				},
				{
				    id: 999,
				    title: 'Repeating Event',
				    start: '2016-01-16T16:00:00'
				},
				{
				    title: 'Conference',
				    start: '2016-01-11',
				    end: '2016-01-13'
				},
				{
				    title: 'Meeting',
				    start: '2016-01-12T10:30:00',
				    end: '2016-01-12T12:30:00'
				},
				{
				    title: 'Lunch',
				    start: '2016-01-12T12:00:00'
				},
				{
				    title: 'Meeting',
				    start: '2016-01-12T14:30:00'
				},
				{
				    title: 'Dinner',
				    start: '2016-01-12T20:00:00'
				},
				{
				    title: 'Birthday Party',
				    start: '2016-01-13T07:00:00'
				},
				{
				    title: 'Click for Google',
				    url: 'http://google.com/',
				    start: '2016-01-28'
				},
                {
                    title: 'Some event for Reliance',
                    start: '2016-03-04T07:00:00'
                }
                ]
            });
        });
    </script>
        <style>
            #calendar {
		max-width: 900px;
        width:900px;
		margin: 0 auto;
	}
        </style>
     <script>
         var customDate = {
             
         }
     </script>
</asp:Content>