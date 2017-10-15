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


public partial class FrmResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (User.Identity.IsAuthenticated)
            {
                Session.Add("username", User.Identity.Name);
                ArrayList a1 = (ArrayList)Session["AnswerList"];
                if (a1 == null)
                {
                    //Response.Redirect("FrmLogin.aspx");
                }
                if (IsPostBack == false)
                {

                    //Calculate Score
                    double questions = a1.Count;
                    double correct = 0.0;
                    for (int i = 0; i < a1.Count; i++)
                    {
                        Answer a = (Answer)a1[i];
                        if (a.Result == Answer.ResultValue.Correct)
                            correct++;

                    }
                    double score = (correct / questions) * 100;
                    SqlDataSource userQuizDataSource = new SqlDataSource();
                    userQuizDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["Quiz2ConnectionString4"].ToString();
                    userQuizDataSource.InsertCommand = "Insert into userQuiz (QuizId,DateTimeComplete,Score,UserName)values (@QuizId,@DateTimeComplete,@Score,@UserName)";
                    userQuizDataSource.InsertParameters.Add("QuizId", Session["QuizID"].ToString());
                    userQuizDataSource.InsertParameters.Add("DateTimeComplete", DateTime.Now.ToString());
                    userQuizDataSource.InsertParameters.Add("Score", score.ToString());
                    userQuizDataSource.InsertParameters.Add("UserName", User.Identity.Name);

                    int rowAffected = userQuizDataSource.Insert();
                    if (rowAffected == 0)
                    {
                        Label1.Text = "OOps Their is a problem saving your Test Score";


                    }
                    else
                    {
                        Label1.Text = score.ToString();
                    }
                }


            }
        }


        catch (Exception msg)
        {
            //Label1.Text = "Unable to process Score. Previous Results are:";
            Label1.Text = msg.Message;

        }
        finally
        {
        }
    }
     

}