﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("Home.aspx");
            Response.Write(@"<script type='text/javascript'>alert('Logged-Out Successfully');</script>");
        }
    }
}