using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Controller
{
    public class TithiController : ApiController
    {
        public IEnumerable<Tithi> GetTithi()
        {
            return new TithiOperations().GetCurrentMonthTithi();
        }

        public IEnumerable<Tithi> GetTithiFor(string from, string to)
        {
            return new TithiOperations().GetTithiFor(DateTime.Parse(from), DateTime.Parse(to));
        }

    }
}