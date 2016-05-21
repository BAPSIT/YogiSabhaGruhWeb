using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;
using Dapper;
using YSGOpsWeb.Models;
namespace YSGOpsWeb.DataLayer
{
    public class FacilityOperations
    {
        private string conn = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;
        public IEnumerable<BookingFacilityInfo> GetBookingFacilities(int bookingNo)
        {
            IDbConnection db = new SqlConnection(this.conn);
          
            //var bookingFacilityList = db.Query<BookingFacilityInfo>("Get_Booking_Facilities", param: new { Booking_No = bookingNo }, commandType: CommandType.StoredProcedure);

            if (bookingNo > 0)
            {
                var bookingFacilityList = db.Query<BookingFacilityInfo, InventoryInfo, BookingFacilityInfo>("Get_Booking_Facilities",
            (a, s) =>
            {
                a.InventoryInfo = s;
                return a;
            },
            new { Booking_No = bookingNo }, null, true,
            splitOn: "Item_no",
             commandTimeout: null, commandType: CommandType.StoredProcedure
               ).AsQueryable();

                return bookingFacilityList;
            }
            else
            {
                List<BookingFacilityInfo> facilityList = new List<BookingFacilityInfo>();

                var inventoryList = db.Query<InventoryInfo>("Get_Booking_Facilities", param: new { Booking_No = 0 }, commandType: CommandType.StoredProcedure).AsQueryable(); ;

                foreach (var inventory in inventoryList)
                {
                    BookingFacilityInfo facilityInfo = new BookingFacilityInfo();
                    facilityInfo.InventoryInfo = inventory;
                    facilityList.Add(facilityInfo);
                }

                return facilityList;

            }


           
        }



        public int AddOrUpdateFaciltiy(CustomerDetails Customer)
        {
            if (Customer.Customer_no == -1)
            {

                Customer.Action = 'A';
            }
            else
            {
                Customer.Action = 'U';
            }
            IDbConnection db = new SqlConnection(this.conn);
            return db.Query<int>("ADD_YSG_Customer_Info", param: Customer, commandType: CommandType.StoredProcedure).FirstOrDefault();

        }


    }
}