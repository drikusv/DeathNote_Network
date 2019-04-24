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

            try
            {
                if (DeathNote_.ChagePassword(CurrentPass, Newpassword))
                {
                    Response.Redirect("~/Forms/Profile.aspx", false);
                }
                
              
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

                
          
            
        }
    }
}