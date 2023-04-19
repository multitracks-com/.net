using Microsoft.AspNetCore.Mvc;

namespace multitracks.Controllers
{
    public class Artist : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public string Get()
        {
            return "Welcome to Web API";
        }
        public List<string> Get(int ID)
        {
            return new List<string>
            {
                "Data1",
                "Data2"
            };
        }
    }
}
