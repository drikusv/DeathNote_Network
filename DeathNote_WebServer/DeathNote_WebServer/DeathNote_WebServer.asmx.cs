using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;

namespace DeathNote_WebServer
{
    /// <summary>
    /// Summary description for DeathNote_WebServer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DeathNote_WebServer : System.Web.Services.WebService
    {

        SqlConnection sqlConn;
        WebServer_ExstraMethods Create = new WebServer_ExstraMethods();

        private bool OpenDatabase()
        {

            string FilePath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\DeathNote_Network";

            sqlConn = new SqlConnection("Server = localhost; Integrated Security = SSPI; DataBase = master");

            SqlCommand cmd = sqlConn.CreateCommand();

            cmd.CommandText = "SELECT * FROM master.dbo.sysdatabases where name = 'DeathNote_DB'";
            sqlConn.Open();

            SqlDataReader SearchDataBase = cmd.ExecuteReader();

            bool foundDataBase = false;

            while (SearchDataBase.Read())
            {
                if (SearchDataBase["name"].ToString() == "DeathNote_DB" && Directory.Exists(FilePath))
                {
                    foundDataBase = true;
                    break;

                }
            }

            SearchDataBase.Close();


            if (foundDataBase)
            {
                sqlConn = new SqlConnection("Server = localhost; Integrated Security = SSPI; Initial Catalog = DeathNote_DB ");
                try
                {
                    sqlConn.Open();
                    return true;

                }
                catch
                {
                    return false;

                }
            }
            else
            {
                if (Create.createDatabase())
                {
                    sqlConn = new SqlConnection("Server = localhost; Integrated Security = SSPI; Initial Catalog = DeathNote_DB ");
                    try
                    {
                        sqlConn.Open();
                        return true;

                    }
                    catch
                    {
                        return false;

                    }

                }
                else
                {
                    return false;
                }
            }
        }


        [WebMethod]
        public string Register(string Email, string FirstName, string LastName, string Password)
        {
            if (OpenDatabase())//Check if the web server can connect to database 
            {
                SqlCommand cmd = sqlConn.CreateCommand();
                cmd.CommandText = "Insert INTO UserInfo([Email],[FirstName],[LastName],[Password])" +
                    "Values ('" + Email + "','" + FirstName + "','" + LastName + "','" + Password + "')";
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return null;
                }

                sqlConn.Close();
                return Email;
            }
            else
            {
                sqlConn.Close();
                return null;
            }

        }

        [WebMethod]
        public bool CreateActive(string Email)
        {
            string Name = "", surname = "";

            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "SELECT * FROM UserInfo";

                SqlDataReader FindUser;
                try
                {
                    FindUser = cmd.ExecuteReader();
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return false;
                }

                while (FindUser.Read())
                {
                    if (Email == FindUser["Email"].ToString())
                    {
                        Name = FindUser["FirstName"].ToString();
                        surname = FindUser["LastName"].ToString();
                        break;
                    }
                }
                FindUser.Close();
                cmd = sqlConn.CreateCommand();

                cmd.CommandText = "INSERT INTO ActiveUser([Email],[Name],[Surname],[UserActive])" +
                    "VALUES ('" + Email + "','" + Name + "','" + surname + "',1)";
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return false;
                }
                sqlConn.Close();
                return true;
            }
            else
            {
                sqlConn.Close();
                return false;
            }

        }

        [WebMethod]
        public bool Login(string Email, string Password)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "SELECT * FROM UserInfo";

                SqlDataReader FindUser = cmd.ExecuteReader();
                bool found = false;

                while (FindUser.Read())
                {
                    if (Email == FindUser["Email"].ToString() && Password == FindUser["Password"].ToString())
                    {
                        found = true;
                        break;
                    }
                }
                FindUser.Close();

                cmd = sqlConn.CreateCommand();
                cmd.CommandText = "SELECT * FROM ActiveUser";


                if (found)
                {
                    cmd = sqlConn.CreateCommand();
                    cmd.CommandText = "SELECT * FROM ActiveUser";
                    SqlDataReader activeUser = cmd.ExecuteReader();

                    while (activeUser.Read())
                    {
                        if (Email == activeUser["Email"].ToString())
                        {

                            cmd = sqlConn.CreateCommand();
                            cmd.CommandText = "UPDATE ActiveUser " +
                                "SET [UserActive] = 1" +
                                "WHERE [Email] = '" + Email + "'";
                            activeUser.Close();

                            try
                            {
                                cmd.ExecuteNonQuery();
                                sqlConn.Close();
                                return true;
                            }
                            catch (Exception e)
                            {
                                sqlConn.Close();
                                return false;
                            }
                        }
                        else
                        {
                            sqlConn.Close();
                            return CreateActive(Email);
                        }
                    }

                }
                else
                {
                    sqlConn.Close();
                    return false;
                }

            }
            else
            {
                sqlConn.Close();
                return false;
            }
            return true;
        }

        [WebMethod]
        public bool LogOut(string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd = sqlConn.CreateCommand();
                cmd.CommandText = "SELECT * FROM ActiveUser";

                cmd = sqlConn.CreateCommand();
                cmd.CommandText = "SELECT * FROM ActiveUser";
                SqlDataReader activeUser = cmd.ExecuteReader();

                while (activeUser.Read())
                {
                    if (Email == activeUser["Email"].ToString())
                    {
                        cmd = sqlConn.CreateCommand();
                        cmd.CommandText = "UPDATE ActiveUser " +
                            "SET [UserActive] = 0" +
                            "WHERE [Email] = '" + Email + "'";
                        activeUser.Close();

                        try
                        {
                            cmd.ExecuteNonQuery();
                            sqlConn.Close();
                            return true;
                        }
                        catch (Exception e)
                        {
                            sqlConn.Close();
                            return false;
                        }
                    }
                    else
                    {
                        sqlConn.Close();
                        return CreateActive(Email);
                    }
                }
            }
            else
            {
                sqlConn.Close();
                return false;
            }
            return true;
        }

        [WebMethod]
        public DataSet Friends(string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "select * from ActiveUser where (Email in (select EmailI from UserFriend WHERE EmailII = '"+Email+"')) or"+
                    " (Email in (select EmailII from UserFriend WHERE EmailI = '"+Email+"'))";
                try
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter findFriends = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    findFriends.Fill(ds);

                    sqlConn.Close();

                    return ds;
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return null;
                }

            }
            else
            {
                sqlConn.Close();
                return null;
            }

        }

        [WebMethod]
        public DataSet FriendRequest(string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "SELECT ActiveUser.Email, ActiveUser.Name, ActiveUser.Surname From ActiveUser, UserRequest WHERE (ActiveUser.Email = UserRequest.EmailFrom) AND" +
                    "(UserRequest.EmailTo = '" + Email + "' AND FriendDecline = 0)";

                try
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter findFriends = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    findFriends.Fill(ds);

                    sqlConn.Close();

                    return ds;
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return null;
                }
            }
            else
            {
                sqlConn.Close();
                return null;
            }
        }

        [WebMethod]
        public bool AcceptOrDecline(bool Accept, string Email, string EmailFrom)
        {
            if (OpenDatabase())
            {
                if (Accept)
                {
                    SqlCommand cmd = sqlConn.CreateCommand();
                    cmd.CommandText = "INSERT INTO UserFriend([EmailI],[EmailII]) " +
                        "VALUES ('" + Email + "','" + EmailFrom + "')";

                    try
                    {
                        cmd.ExecuteNonQuery();
                        
                        
                    }
                    catch (Exception e)
                    {
                        sqlConn.Close();
                        return false;
                    }

                     cmd = sqlConn.CreateCommand();
                    cmd.CommandText = "DELETE FROM UserRequest" +
                        "WHERE [EmailTo] = '"+Email+"' AND [EmailFrom] = '"+EmailFrom+"'";

                    try
                    {
                        cmd.ExecuteNonQuery();
                        sqlConn.Close();
                        return true;
                    }
                    catch(Exception e)
                    {
                        sqlConn.Close();
                        return false;
                    }

                    

                }
                else
                {
                    SqlCommand cmd = sqlConn.CreateCommand();
                    cmd.CommandText = "UPDATE UserRequest " +
                        "SET FriendDecline = 1" +
                        "WHERE EmailFrom = '" + EmailFrom + "' And EmailTo = '" + Email + "'";

                    try
                    {
                        cmd.ExecuteNonQuery();
                        sqlConn.Close();
                        return true;
                    }
                    catch (Exception)
                    {
                        sqlConn.Close();
                        return false;
                    }

                }

            }
            else
            {
                sqlConn.Close();
                return false;
            }
        }

        [WebMethod]
        public DataSet Users(string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "select * from UserInfo" +
                    "where" +
                    "Not((Email in (select EmailI from UserFriend WHERE EmailII = '"+Email+"'))"+
                    " or (Email in (select EmailII from UserFriend WHERE EmailI = '" + Email + "')))" +
                    "AND" +
                    "Not((Email in (select EmailTO from UserRequest WHERE EmailFrom = '" + Email + "'))" +
                    " or (Email in (select EmailFrom from UserRequest WHERE EmailTO = '" + Email + "')))" +
                    "And Not(Email = '" + Email + "')";
                try
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter user = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    user.Fill(ds);

                    sqlConn.Close();

                    return ds;
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return null;
                }

            }
            else
            {
                sqlConn.Close();
                return null;
            }
        }

        [WebMethod]
        public bool CreatRequest(string Email, string EmailTo)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "SELECT * FROM UserRequest WHERE ([EmailTO] = '" + EmailTo + "' AND [EmailFrom] = '" + Email + "' AND FriendDecline = 1)" +
                    "([EmailTO] = '" + EmailTo + "' AND [EmailFrom] = '" + Email + "' AND FriendDecline = 1)";

                try
                {
                    SqlDataReader read = cmd.ExecuteReader();
                    while (read.Read())
                    {
                        if(Email == read["EmailFrom"].ToString() && EmailTo == read["EmailTo"].ToString() && read["FriendDecline"].ToString() == "0")
                        {
                            return true;
                        }
                        else if (Email == read["EmailFrom"].ToString() && EmailTo == read["EmailTo"].ToString() && read["FriendDecline"].ToString() == "1")
                        {
                            cmd = sqlConn.CreateCommand();

                            cmd.CommandText = "UPDATE UserRequest" +
                                "SET FriendDecline = 0" +
                                "WHERE [EmailTO] = '" + EmailTo + "' AND [EmailFrom] = '" + Email + "'";

                            try
                            {
                                cmd.ExecuteNonQuery();
                                sqlConn.Close();
                               
                            }
                            catch (Exception e)
                            {
                                sqlConn.Close();
                                return false;
                            }

                            return true;

                        }
                        else
                        {
                            cmd = sqlConn.CreateCommand();

                            cmd.CommandText = "INSERT INTO UserRequest([EmailTo],[EmailFrom],[FriendDecline])" +
                                "VALUES ('" + EmailTo + "','" + Email + "',0)";

                            try
                            {
                                cmd.ExecuteNonQuery();
                                sqlConn.Close();
                                
                            }
                            catch (Exception e)
                            {
                                sqlConn.Close();
                                return false;
                            }

                            return true;

                        }
                    }
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return false;
                }
                return true;
            }

            else
            {
                sqlConn.Close();
                return false;
            }
        }

        [WebMethod]
        public DataSet Profile(string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "SELECT Email, FirstName, LastName FROM UserInfo WHERE Email = '"+Email+"'";
                try
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter user = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable("UserInfo");
                    user.TableMappings.Add("Table", "UserInfo");
                    user.Fill(ds);

                   

                   

                   // XmlDataDocument xmlData = new XmlDataDocument(ds);
                   //XmlElement xmlElemnt = xmlData.DocumentElement;

                    sqlConn.Close();

                    return ds;
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return null;
                }

            }
            else
            {
                sqlConn.Close();
                return null;
            }
        }

        [WebMethod]
        public bool EditProfile(string FirstName, string LastName, string Email, string NewEmail)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                if(Email != NewEmail)
                {
                    cmd.CommandText = "UPDATE UserInfo " +
                        "SET [FirstName] = '" + FirstName + "', [LastName] = '" + LastName + "', [Email] = '" + Email + "'" +
                        "WHERE Email = '" + Email + "'";

                }
                else
                {
                    cmd.CommandText = "UPDATE UserInfo " +
                        "SET [FirstName] = '" + FirstName + "', [LastName] = '" + LastName + "'" +
                        "WHERE Email = '" + Email + "'";

                }
                try
                {
                    cmd.ExecuteNonQuery();
                    sqlConn.Close();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }

               
            }
            else
            {
                sqlConn.Close();
                return false;
            }
        }

        [WebMethod]
        public bool ChagePassword(string OldPassword, string NewPassword)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                cmd.CommandText = "Update UserInfo" +
                    "SET Password = '"+NewPassword+"'" +
                    "WHERE Password = '"+OldPassword+"'";

                try
                {
                    cmd.ExecuteNonQuery();
                    sqlConn.Close();
                    return true;
                }
                catch (Exception e)
                {
                    sqlConn.Close();
                    return false;
                }
            }
            else
            {
                sqlConn.Close();
                return false;
            }
        }

        [WebMethod]
        public bool ChageActive(bool Active,string Email)
        {
            if (OpenDatabase())
            {
                SqlCommand cmd = sqlConn.CreateCommand();

                if (Active)
                {
                    cmd.CommandText = "UPDATE ActiveUser " +
                        "SET UserActive = 1" +
                        "WHERE Email = '"+Email+"'";
                    
                    
                }
                else
                {
                    cmd.CommandText = "UPDATE ActiveUser " +
                        "SET UserActive = 0" +
                        "WHERE Email = '" + Email + "'";
                   
                    
                }

                try
                {
                    cmd.ExecuteNonQuery();
                    sqlConn.Close();
                    return true;
                }
                catch (Exception e)
                {
                    return false;

                }
            }
            else
            {
                sqlConn.Close();
                return false;
            }
        }
    }
}
