using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeathNote_Site.DeathNote_WebServer;

namespace DeathNote_Site.Forms
{
    public partial class Friends : System.Web.UI.Page
    {
        DeathNote_WebServerSoapClient DeathNote_ = new DeathNote_WebServerSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFriend();
                LoadRequest();
                LoadUsers();

                

            }
        }

        private void LoadFriend()
        {
            DataSet ds = new DataSet();

            try
            {
                ds = DeathNote_.Friends(Session["Email"].ToString());
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }
            

            dlistFriends.DataSource = ds;
            dlistFriends.DataBind();
        }

        private void LoadRequest()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = DeathNote_.FriendRequest(Session["Email"].ToString());
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

           

            dlistRequest.DataSource = ds;
            dlistRequest.DataBind();
        }

        private void LoadUsers()
        {
            DataSet ds = new DataSet();

            try
            {
                ds = DeathNote_.Users(Session["Email"].ToString());
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

            

            dlistUsers.DataSource = ds;
            dlistUsers.DataBind();
        }

        protected void dlistRequest_ItemCommand(object source, DataListCommandEventArgs e)
        {
           
        }

        protected void btnAcceptR_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;

            var item = (DataListItem)btn.NamingContainer;
            var lblEmail = (Label)item.FindControl("lblEmailR");

            string Email = Session["Email"].ToString();
            string EmailFrom = lblEmail.Text;
            try
            {
                if (DeathNote_.AcceptOrDecline(true, Email, EmailFrom))
                {
                    LoadFriend();
                    LoadRequest();
                }

            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

            
        }

        protected void btnDeclineR_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;

            var item = (DataListItem)btn.NamingContainer;
            var lblEmail = (Label)item.FindControl("lblEmailR");

            string Email = Session["Email"].ToString();
            string EmailFrom = lblEmail.Text;
            try
            {
                if (DeathNote_.AcceptOrDecline(false, Email, EmailFrom))
                {
                    LoadFriend();
                    LoadRequest();
                    LoadUsers();
                }
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;

            var item = (DataListItem)btn.NamingContainer;
            var lblEmail = (Label)item.FindControl("lblEmailU");

            string EmailTo = lblEmail.Text;
            string Email = Session["Email"].ToString();
            try
            {
                if (DeathNote_.CreatRequest(Email, EmailTo))
                {
                    LoadFriend();
                    LoadRequest();
                    LoadUsers();

                }
            }
            catch
            {
                Response.Redirect("~/Forms/Error.aspx", true);
            }

            
        }
    }
}