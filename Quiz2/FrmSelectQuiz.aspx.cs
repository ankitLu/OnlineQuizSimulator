using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class FrmSelectQuiz : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ClsUser us = new ClsUser();
        string user = us.UserId; ;
        if (user == null)
        {
            Response.Redirect("FrmLogin.aspx");
        }

    }
}
