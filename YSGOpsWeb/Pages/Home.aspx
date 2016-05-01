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
    <link href="../Content/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <script src="../Scripts/moment.min.js"></script>
    <script src="../Scripts/fullcalendar.min.js"></script>
    <script src="../Scripts/Home.js"></script>
    <link href="../Content/bootstrap-fullcalendar.css" rel="stylesheet" />

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
