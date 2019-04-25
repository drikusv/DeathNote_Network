# DeathNote_Network
Social Network

###### Web Server
1. Make Sure you can run sql server.
2. open the DeathNote_WebServer.snl.
3. Open solution explorer.
4. Right click on DeathNote_WebServer under the solution go to properties.
5. Go to web inside properties.
6. Make sure Specific page is selected inside text box must be "DeathNote_WebServer.asmx".
7. Then run the web server.

 ###### Web Application
1. Open the DeathNote_Site.snl.
3. Open solution explorer.
4. Right click on DeathNote_Site under the solution go to propeties.
5. Go to web inside properties.
6. Make sure Specific page is selected inside text box must be "Forms/Login.aspx".
7. Run The Web application.

 ###### if The DeathNote_Site can not pick up the web server
1. Make sure The web server Run.
2. If the web server run Go to Solution explorer
3. Right click on DeathNote_WebServer under Connected Services.
4. Click on update services reference.
5. If it can not update.
6. Right click on DeathNote_Site under the solution go to Add.
7. Click on service reference.
8. Copy Web server Address in the web broswer and past it into address of add service reference.
9. In Namespace give the name "DeathNote_WebServer" and click ok.
10. Try to update "DeathNote_WebServer" if success run web application.


###### Notes
1. Active of user works only if user logout and not when browser is closed.
