﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Models;
namespace YSGOpsWeb.Controller
{
    public class BookingController : ApiController
    {

        public IEnumerable<BookingInfo> GetBookingByDate(string from, string to)
        {
            return new BookingOperations().GetBookingByDate(DateTime.Parse(from), DateTime.Parse(to));
        }


        public IEnumerable<BookingFacilityInfo> GetBookingFacilities(string bookingNo)
        {
            var bookingFacilityList =  new BookingFacilityOperations().GetBookingFacilities(int.Parse(bookingNo)).ToList();
            return bookingFacilityList;
        }

       
        //// GET api/<controller>/5
        //public BookingInfo Get(int id)
        //{
        //    return new BookingOperations().GetBooking(id);
        //}

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}