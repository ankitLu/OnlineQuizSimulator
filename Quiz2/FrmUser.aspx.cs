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

public partial class FrmUser : System.Web.UI.Page
{
    ClsUser us = new ClsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            LblUserId.Text = User.Identity.Name;
            ArrayList a1 = new ArrayList();
            Session.Add("AnswerList", a1);
            int testID = 1;
            Session.Add("QuizID", testID);

            //if (Request.QueryString["testid"] != null)
            //{
            //    int testID = int.Parse(Request.QueryString["testid"].ToString());
            //    Session.Add("QuizID", testID);
            //}
            //else
            //{
            //    Response.Redirect("FrmLogin.aspx");
            //}
        }
        else
        {
            Response.Redirect("FrmLogin.aspx");
        }
    }
    protected void BtnStartTest_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmQuiz.aspx");
    }
}
