using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using DeathNote_Site.DeathNote_WebServer;

namespace DeathNote_Site.Forms
{
    public partial class Profile : System.Web.UI.Page
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();
        string FirstName = "", LastName = "", Email = "";

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/ChangePassword.aspx", true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Email = Session["Email"].ToString();

                DataSet Profile = new DataSet();
                DataTable dt = new DataTable();
                Profile = DeathNote_.Profile(Email);

                dt = Profile.Tables["UserInfo"];

                foreach(DataRow dr in dt.Rows)
                {
                    if (dr["Email"].ToString() == Email)
                    {
                        tbxFirstName.Text = dr["FirstName"].ToString();
                        tbxLastName.Text = dr["LastName"].ToString();
                        tbxEmail.Text = dr["Email"].ToString();
                    }
                }

              

                
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
           
           


            if (btnEdit.Text == "Edit")
            {
                FirstName = tbxFirstName.Text;
                LastName = tbxLastName.Text;
                Email = tbxEmail.Text;

                tbxFirstName.ReadOnly = false;
                tbxLastName.ReadOnly = false;
                tbxEmail.ReadOnly = false;

                btnEdit.Text = "Save";
            }
            else if (btnEdit.Text == "Save")
            {
                if (tbxFirstName.Text == FirstName && tbxLastName.Text == LastName && tbxEmail.Text == Email)
                {
                    tbxFirstName.ReadOnly = true;
                    tbxLastName.ReadOnly = true;
                    tbxEmail.ReadOnly = true;

                    btnEdit.Text = "Edit";
                }
                else
                {
                    FirstName = tbxFirstName.Text;
                    LastName = tbxLastName.Text;
                    Email = tbxEmail.Text;

                    if (DeathNote_.EditProfile(FirstName, LastName, Session["Email"].ToString(), Email))
                    {
                        tbxFirstName.ReadOnly = true;
                        tbxLastName.ReadOnly = true;
                        tbxEmail.ReadOnly = true;
                        btnEdit.Text = "Edit";
                    }
                    else
                    {
                        lblFail.Visible = true;
                    }
                }
            }
           
        }
    }
}