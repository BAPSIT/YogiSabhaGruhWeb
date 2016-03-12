using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
[assembly: OwinStartup(typeof(YSGOpsWeb.Startup))]
namespace YSGOpsWeb
{
    public class Startup
    {
        public void ConfigureAuth(IAppBuilder app)
        {
            //var timeoutInMinutes = int.Parse(ConfigurationManager.AppSettings["cookie.timeout-minutes"]);

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                AuthenticationMode = AuthenticationMode.Active,
                LoginPath = new PathString("/pages/Login.aspx"),
               // ExpireTimeSpan = TimeSpan.FromMinutes(timeoutInMinutes),
                //SlidingExpiration = true,
               // LogoutPath = new PathString("/Sessions/Logout")
            });
        }
    }
}