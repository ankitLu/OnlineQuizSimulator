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
using System.Data.SqlClient;

public partial class FrmLogin : System.Web.UI.Page
{
    ClsUser us = new ClsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        
    }


    //protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    //{
    //    SqlConnection con = new SqlConnection();
    //    con.ConnectionString = ConfigurationManager.ConnectionStrings["Quiz2ConnectionString"].ConnectionString;
    //    if (con.State == ConnectionState.Closed)
    //    {
    //        con.Open();
    //    }
    //    SqlCommand cmd = new SqlCommand("logincheck", con);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@Uid", Login1.UserName);
    //    cmd.Parameters.AddWithValue("@Pwd", Login1.Password);
    //    SqlParameter p1 = new SqlParameter("@ret", SqlDbType.Int);
    //    p1.Direction = ParameterDirection.ReturnValue;
    //    cmd.Parameters.Add(p1);
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    Int32 i = Convert.ToInt32(cmd.Parameters["@ret"].Value);
    //    if (i == -1)
    //    {
    //        Login1.FailureText = "Username entered is invalid";
            
    //    }
    //    else if (i == 2)
    //    {
    //       us.UserId = Login1.UserName;
    //       Response.Redirect("FrmSelectQuiz.aspx");
    //    }
    //    else
    //    {
    //        Login1.FailureText="Login Unsucessful";
    //        Login1.UserName = "";
    //    }
    //}

   
}
  
