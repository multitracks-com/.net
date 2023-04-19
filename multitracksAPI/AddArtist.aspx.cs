using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace multitracksAPI
{
    public partial class AddArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using(var wb = new WebClient())
            {
                var data = new NameValueCollection();
                data["title"] = tbxTitle.Text;
                data["biography"] = tbxBio.Text;
                data["imageUrl"] = tbxImageURL.Text;
                data["heroURL"] = tbxHeroURL.Text;

                var resp = wb.UploadValues(ResolveUrl("https://localhost:44327/api/Artists/add"), "POST", data);
                string responseInString = Encoding.UTF8.GetString(resp);
                lblResp.Text = responseInString;
            }
            
        }
    }
}