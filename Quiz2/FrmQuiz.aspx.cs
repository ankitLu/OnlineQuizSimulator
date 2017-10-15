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

public partial class FrmQuiz : System.Web.UI.Page
{
    static Int32 TimeLeft = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = TimeLeft.ToString();
        Timer1.Enabled = false;
        Timer2.Enabled = true;
        DetailsView1.DataBind();
        DetailsView1.Visible = true;
        
    }
    protected void BtnNextQues_Click(object sender, EventArgs e)
    {
        
        System.Data.DataRowView dr = (System.Data.DataRowView)(DetailsView1.DataItem);
        Answer a = new Answer();
        a.QuestionID = dr["QuestionOrder"].ToString();
        a.CorrectAnswer = dr["CorrectAnswer"].ToString();
        a.UserAnswer = DDLUserAns.SelectedValue.ToString();
        ArrayList a1 = (ArrayList)Session["AnswerList"];
        a1.Add(a);
        if (DetailsView1.PageIndex == DetailsView1.PageCount - 1)
        {
            Response.Redirect("FrmResult.aspx");
        }
        else
        {
            DetailsView1.PageIndex += 1;
        }
        if (DetailsView1.PageIndex == DetailsView1.PageCount - 1)
        {
            BtnNextQues.Text = "Finish";
        }
        
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        if (TimeLeft <= 0)
        {
            Timer2.Enabled = false;
            Response.Redirect("FrmResult.aspx");
        }
        //if (TimeLeft <= 5)
        //{//Label1.ForeColor=System.
        //}
        else
        {
            TimeLeft = TimeLeft - 1;
        }
        Label1.Text = TimeLeft.ToString();
    }
}
