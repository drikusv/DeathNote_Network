using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeathNote_Site.DeathNote_WebServer;

namespace DeathNote_Site.UserControl
{
    public partial class Menu : System.Web.UI.UserControl
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                try
                {
                    dt = DeathNote_.Profile(Session["Email"].ToString()).Tables["UserInfo"];
                }
                catch
                {
                    Response.Redirect("~/Forms/Error.aspx", true);
                }

                

                foreach(DataRow dr in dt.Rows)
                {
                    if(Session["Email"].ToString() == dr["Email"].ToString())
                    {
                        lblLogin.Text = "Welcome " + dr["FirstName"].ToString() + " " + dr["LastName"].ToString();
                    }
                }
            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Profile.aspx",true);
        }

        protected void btnFriends_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Friends.aspx", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (DeathNote_.LogOut(Session["Email"].ToString()))
            {
                Session.RemoveAll();
                Response.Redirect("~/Forms/Login.aspx", true);
            }
            else
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }
            
        }
    }
}