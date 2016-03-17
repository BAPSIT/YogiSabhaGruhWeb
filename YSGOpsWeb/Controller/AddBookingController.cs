using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Http;
using YSGOpsWeb.Models;
using System.Net.Http;
using System.Net;

namespace YSGOpsWeb.Controller
{
    public class AddBookingController  : ApiController
    {
        IAddBookingRepository repository;

        public AddBookingController(IAddBookingRepository repository)
        {
            this.repository = repository;
        }

        #region GET
        [Queryable]
        public IQueryable<YSG_Booking_Info> GetComments()
        {
            return repository.Get().AsQueryable();
        }

        public YSG_Booking_Info GetComment(int id)
        {
            YSG_Booking_Info comment;
            if (!repository.TryGet(id, out comment))
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            return comment;
        }
        #endregion

        #region POST
        public HttpResponseMessage PostComment(YSG_Booking_Info info)
        {
            info = repository.Add(info);
            var response = Request.CreateResponse<YSG_Booking_Info>(HttpStatusCode.Created, info);
            response.Headers.Location = new Uri(Request.RequestUri, "/api/Bookings/" + info.Booking_ID.ToString());
            return response;
        }
        #endregion

        #region DELETE
        public YSG_Booking_Info DeleteInfo(int id)
        {
            YSG_Booking_Info comment;
            if (!repository.TryGet(id, out comment))
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            repository.Delete(id);
            return comment;
        }
        #endregion

        #region Paging GET
        public IEnumerable<YSG_Booking_Info> GetComments(int pageIndex, int pageSize)
        {
            return repository.Get().Skip(pageIndex * pageSize).Take(pageSize);
        }
        #endregion
    }
}