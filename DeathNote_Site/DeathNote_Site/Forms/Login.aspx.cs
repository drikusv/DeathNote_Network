using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeathNote_Site.DeathNote_WebServer;
using DeathNote_Site.Class;

namespace DeathNote_Site.Forms
{
    public partial class Login : System.Web.UI.Page
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblWarrning.Visible = false;
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies != null)
                {
                    tbxEmail.Text = reqCookies["Email"].ToString();
                    
                }

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Encryption encrypt = new Encryption();

            string Email = tbxEmail.Text;
            string Pass = encrypt.Encrypt(tbxPassword.Text);
           
            if (DeathNote_.Login(Email, Pass))
            {

                if (cbxRemember.Checked)
                {
                    HttpCookie userInfo = new HttpCookie("userInfo");
                    userInfo["Email"] = Email;
                    Response.Cookies.Add(userInfo);
                    Session["Email"] = Email;


                }
                else
                {
                    Session["Email"] = Email;
                }
                Response.Redirect("~/Forms/Profile.aspx", true);


            }
            else
            {
                lblWarrning.Text = "Email Or Password is incorect";
                lblWarrning.Visible = true;
            }
        }

        protected void btnRegester_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Regester.aspx", true);
        }
    }
}