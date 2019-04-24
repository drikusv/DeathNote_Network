# DeathNote_Network
Social Network

###### Web Server
1. Make Sure you can run sql server.
2. open the DeathNote_WebServer.snl.
3. Open solution explorer.
4. right click on DeathNote_WebServer under the solution go to propeties.
5. Go to web inside popeties.
6. Make sure Specific page is selected inside text box must be "DeathNote_WebServer.asmx".
7. Then run the web server.

 ###### Web Application
1. open the DeathNote_Site.snl.
3. Open solution explorer.
4. right click on DeathNote_Site under the solution go to propeties.
5. Go to web inside popeties.
6. Make sure Specific page is selected inside text box must be "Forms/Login.aspx".
7. Run The Web application.

 ###### if The DeathNote_Site can not pick up the web server
1. Make sure The web server Run.
2. if the web server run Go to Solution explorer
3. right click on DeathNote_WebServer under Connected Services.
4. click on update services reference.
5. if it can not update.
6. right click on DeathNote_Site under the solution go to Add.
7. click on service reference.
8. copy Web server Address in the web broswer and past it into address of add service reference.
9. In Namespace giv the name "DeathNote_WebServer" and click ok.
10. Try to update "DeathNote_WebServer" if succses run web application.


###### Notes
1. Active of user works only if user logout and not when broswer is been closed.
