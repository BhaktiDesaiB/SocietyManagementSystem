using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace project
{
    /// <summary>
    /// Summary description for ChatService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class ChatService : System.Web.Services.WebService
    {


        [WebMethod(EnableSession = true)]
        public String AddUser(String userName)
        {
            //add our new user to the application object
            String newId = Session.SessionID;
            if (!((Dictionary<String, String>)Application["UserList"]).Keys.Contains(newId))
                ((Dictionary<String, String>)Application["UserList"]).Add(newId, userName);

            return "Success";
        }

        /// <summary>
        /// Adds a new chat message.
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        public String AddGlobalChat(String message)
        {
            String userId = Session.SessionID;
            ((List<Object>)Application["GlobalChat"]).Add(
                new
                {
                    time = DateTime.Now.ToString("hh:mm"),
                    message = ((Dictionary<String, String>)Application
                    ["UserList"])[userId] + ": " + message
                });

            return "Success";
        }

        /// <summary>
        /// Returns the global chat data.
        /// </summary>
        /// <returns>Object containing the global chat data</returns>
        [WebMethod(EnableSession = true)]
        public Object GetGlobalChat()
        {
            List<Object> messages = (List<Object>)Application["GlobalChat"];
            return messages;
        }  


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
    }
}
