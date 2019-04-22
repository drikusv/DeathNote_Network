using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeathNote_Site.DeathNote_WebServer;

namespace DeathNote_Site.Forms
{
    public partial class Regester : System.Web.UI.Page
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnRegester_Click(object sender, EventArgs e)
        {
            string Name = tbxFirstName.Text;
            string Surname = tbxLastName.Text;
            string Email = tbxEmail.Text;
            string Pass = tbxPassword.Text;
            string ComPass = tbxComfirmPassword.Text;

            if(Pass == ComPass)
            {
                if ((Email = DeathNote_.Register(Email, Name, Surname, Pass)) != null)
                {
                    Session["Email"] = Email;

                    Response.Redirect("~/Forms/Profile.aspx", true);
                }
                else
                {
                    lblFail.Text = "Failed to create a user";
                }


            }
            else
            {
                lblFail.Text = "The passwords does not match";
            }
           
        }
    }
}