using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using DataAccess;
using multitracksAPI.Models;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace multitracksAPI.Controllers
{
    //Uses the Controller base class to return a dynamic view rather than the traditional APIController.
    //I mapped it to open to this view instead of making a web form to showcase ActionResults
    public class SongsController : Controller 
    {
        private Song s = new Song();
        //GET url/Songs/List
        [System.Web.Http.HttpGet]
        public ActionResult List()
        {
            var model = s.GetSongs();
            if(model == null)
            {
                return HttpNotFound("Item Not Found!");
            }
            return View(model);
        }
    }
}
