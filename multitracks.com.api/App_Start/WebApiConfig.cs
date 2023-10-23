using Autofac;
using Autofac.Integration.WebApi;
using multitracks.com.api.Controllers;
using multitracks.com.api.Repository;
using multitracks.com.api.Repository.Interface;
using System.Web.Http;

namespace multitracks.com.api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Create a new container builder
            var builder = new ContainerBuilder();

            // Register your repository
            builder.RegisterType<ArtistRepository>().As<IArtistRepository>().InstancePerDependency();

            // Register your controller
            builder.RegisterType<ArtistController>().InstancePerRequest();

            // Build the container
            var container = builder.Build();

            // Set the dependency resolver for Web API to use Autofac
            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}