using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;

namespace YSGOpsWeb.Class
{
    public static class ServiceFactory
    {
        public static T GetService<T>()
        {
            System.Net.ServicePointManager.Expect100Continue = false;
            var fact = new ChannelFactory<T>(typeof(T).FullName);
            T ret = fact.CreateChannel();
            return ret;
        }

        public static void CloseOrAbort(ICommunicationObject service)
        {
            if (service == null)
            {
                return;
            }
            if (service.State != CommunicationState.Closed || service.State != CommunicationState.Closing)
            {
                try
                {
                    service.Close();
                }
                catch (CommunicationException)
                {
                    service.Abort();
                }
                catch (TimeoutException)
                {
                    service.Abort();
                }
                catch (Exception)
                {
                    service.Abort();
                }
            }
        }

    }
}