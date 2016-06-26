<%@ Page Title="" Language="C#" MasterPageFile="~/Master/YSGWeb.Master" AutoEventWireup="true" CodeBehind="booking_datewise.aspx.cs" Inherits="YSGOpsWeb.Pages.booking_datewise" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="panel panel-default">
        <div class="panel-heading">Booking Datewise</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingDate">Select Hall Name</label><span class="text-danger">*</span>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="271px" DataSourceID="SqlDataSource1" DataTextField="Hall_name" DataValueField="Hall_no"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YogiSabhaGruhConnectionString %>" SelectCommand="SELECT Hall_no, Hall_name FROM dbo.YSG_Hall_Master ORDER BY Hall_name"></asp:SqlDataSource>
                    </div>


                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingFrom">From</label><span class="text-danger">*</span>
                        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                    </div>

                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="form-inline">
                        <label for="inpBookingTo">To</label><span class="text-danger">*</span>
                        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox2">
                        </asp:CalendarExtender>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Report" />
                    </div>

                </div>
            </div>

             <div class="row">

                 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1019px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                     <LocalReport ReportPath="Reports\booking_datewise.rdlc">
                         <DataSources>
                             <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet1" />
                         </DataSources>
                     </LocalReport>
                 </rsweb:ReportViewer>

                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YogiSabhaGruhConnectionString %>" SelectCommand="RPT_BOOKING_DETAILS_DATE_WISE" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="1-MAR-2016" Name="Start_Date" QueryStringField="sdate" />
                         <asp:QueryStringParameter DefaultValue="30-MAR-2017" Name="End_Date" QueryStringField="edate" />
                         <asp:QueryStringParameter DefaultValue="1" Name="Hall_no" QueryStringField="hallno" />
                     </SelectParameters>
                 </asp:SqlDataSource>

<asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
             </div>

            </div>
            </div>

</asp:Content>
