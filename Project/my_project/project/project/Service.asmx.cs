using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

namespace project
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {

        [WebMethod]
        public Thread[] getThreads(string ForumId)
        {
            List<Thread> _list = new List<Thread>();

            string query = "select * from vwThread where forumid='" + ForumId + "' order by [Thread ID] desc";
            Database db = new Database();
            DataSet ds = new DataSet();
            ds = db.getData(query);
            if (ds.Tables.Count>0)
            {
                if (ds.Tables[0].Rows.Count>0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        _list.Add(new Thread(row.ItemArray.GetValue(0).ToString(), row.ItemArray.GetValue(1).ToString(), row.ItemArray.GetValue(2).ToString(), row.ItemArray.GetValue(3).ToString(), row.ItemArray.GetValue(4).ToString(), row.ItemArray.GetValue(5).ToString(), row.ItemArray.GetValue(6).ToString(), row.ItemArray.GetValue(7).ToString()));
                    }
                }
            }

            return _list.ToArray();
        }
    }
}
