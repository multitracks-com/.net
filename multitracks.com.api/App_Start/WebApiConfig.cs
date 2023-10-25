using Autofac;
using Autofac.Integration.WebApi;
using System.Linq;
using System.Reflection;
using System.Web.Http;

namespace multitracks.com.api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Create a new container builder
            var builder = new ContainerBuilder();

            // Use reflection to automatically register all interfaces and their implementations
            RegisterInterfacesAndImplementations(builder);

            // Register your controller
            RegisterControllers(builder);

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

        private static void RegisterInterfacesAndImplementations(ContainerBuilder builder)
        {
            // Get the current assembly (you can specify a different assembly if needed)
            var assembly = Assembly.GetExecutingAssembly();

            // Use reflection to find all interfaces and their implementations
            var types = assembly.GetTypes();

            var interfaceTypes = types.Where(type => type.IsInterface);
            var concreteTypes = types.Where(type => !type.IsInterface && !type.IsAbstract);

            foreach (var interfaceType in interfaceTypes)
            {
                // Find the corresponding implementation type based on naming conventions
                var implementationType = concreteTypes.FirstOrDefault(t =>
                    interfaceType.IsAssignableFrom(t) && t.Name.StartsWith(interfaceType.Name.Substring(1)));

                if (implementationType != null)
                {
                    builder.RegisterType(implementationType).As(interfaceType).InstancePerDependency();
                }
            }
        }

        private static void RegisterControllers(ContainerBuilder builder)
        {
            // Get the current assembly (you can specify a different assembly if needed)
            var assembly = Assembly.GetExecutingAssembly();

            // Use reflection to find all classes that inherit from ApiController
            var controllerTypes = assembly.GetTypes()
                .Where(type => typeof(ApiController).IsAssignableFrom(type) && !type.IsAbstract);

            // Register all found controllers
            foreach (var controllerType in controllerTypes)
            {
                builder.RegisterType(controllerType).InstancePerRequest();
            }
        }
    }
}