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
    public partial class ChangePassword : System.Web.UI.Page
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();
        Encryption encrypt = new Encryption();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CurrentPass = encrypt.Encrypt(tbxCurrentPassword.Text);
            string Newpassword = encrypt.Encrypt(tbxNewPassword.Text);
            string ComNewPassword = encrypt.Encrypt(tbxCNewPassword.Text);

            if(Newpassword == ComNewPassword)
            {
                if (DeathNote_.ChagePassword(CurrentPass, Newpassword))
                {
                    Response.Redirect("~/Forms/Profile.aspx", true);
                }
                else
                {
                    lblFail.Text = "Could not update your password there is problem to connect to the Database";
                    lblFail.Visible = true;
                }
            }
            else
            {
                lblFail.Text = "The new password and comfirmed password does not match";
                lblFail.Visible = true;

            }
            
        }
    }
}