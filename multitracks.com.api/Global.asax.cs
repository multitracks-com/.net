using Swashbuckle.Application;
using System.Web.Http;

namespace multitracks.com.api
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            //https://localhost:44327/swagger/ui/index
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}