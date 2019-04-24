using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace DeathNote_WebServer
{
    public class WebServer_ExstraMethods
    {
         public bool createDatabase()
        {
            SqlConnection sqlConn;

            string FilePath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\DeathNote_Network";

            if (Directory.Exists(FilePath))
            {
                Directory.Delete(FilePath);
            }

            DirectorySecurity securityRules = new DirectorySecurity();

            securityRules.AddAccessRule(new FileSystemAccessRule("Users", FileSystemRights.Modify, AccessControlType.Allow));

            Directory.CreateDirectory(FilePath + @"\DB", securityRules);

            #region Create Database

            string CreateData = "CREATE DATABASE DeathNote_DB ON PRIMARY" +
                "( NAME = ' DeathNote_data ' ," +
                "FILENAME = '" + FilePath + @"\DB\DeathNote_data.mdf', " +
                "SIZE = 10MB, FILEGROWTH = 10%)" +
                "LOG ON ( NAME = ' DeathNote_log '," +
                "FILENAME = '" + FilePath + @"\DB\DeathNote_log.ldf'," +
                "SIZE = 10MB, FILEGROWTH = 10%)";

            sqlConn = new SqlConnection("Server = localhost; Integrated Security = SSPI; DataBase = master");
            SqlCommand cmd = sqlConn.CreateCommand();
            cmd.CommandText = CreateData;

            try
            {
                sqlConn.Open();
                cmd.ExecuteNonQuery();
                sqlConn.Close();

            }
            catch (Exception e)
            {
                return false;
            }
            #endregion

            #region Create Tables

            sqlConn = new SqlConnection("Server = localhost; Integrated Security = SSPI; Initial Catalog = DeathNote_DB ");

            string CreateUserInfo = "CREATE TABLE UserInfo" +
                "( Email VARCHAR(30) NOT NULL PRIMARY KEY," +
                "FirstName VARCHAR(30) NOT NULL," +
                "LastName VARCHAR(30) NOT NULL," +
                 "Password VARCHAR(100) NOT NULL )";

            string CreateActiveUser = "CREATE TABLE ActiveUser" +
                "( Email VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES UserInfo(Email)," +
                "Name VARCHAR(30) NOT NULL," +
                "Surname VARCHAR(30) NOT NULL," +
                "UserActive BIT NOT NULL CHECK (UserActive in (0,1))," +
                "PRIMARY KEY (Email) )";

            string CreateUserRequest = "CREATE TABLE UserRequest" +
                "( RequestID INT NOT NULL PRIMARY KEY IDENTITY,  " +
                "EmailTO VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES UserInfo(Email)," +
                "EmailFrom VARCHAR(30) NOT NULL  FOREIGN KEY REFERENCES UserInfo(Email))";

            string CreateUserFriend = "CREATE TABLE UserFriend" +
                "( FreindID INT NOT NULL PRIMARY KEY IDENTITY,  " +
                "EmailI VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES UserInfo(Email)," +
                "EmailII VARCHAR(30) NOT NULL  FOREIGN KEY REFERENCES UserInfo(Email) )";

            SqlCommand cmd2 = sqlConn.CreateCommand();

            try
            {
                sqlConn.Open();

                cmd2.CommandText = CreateUserInfo;
                cmd2.ExecuteNonQuery();

                cmd2.CommandText = CreateActiveUser;
                cmd2.ExecuteNonQuery();

                cmd2.CommandText = CreateUserRequest;
                cmd2.ExecuteNonQuery();

                cmd2.CommandText = CreateUserFriend;
                cmd2.ExecuteNonQuery();

                sqlConn.Close();

            }
            catch (Exception e)
            {

                return false;
            }

            #endregion


            return true;

        }
    }
}