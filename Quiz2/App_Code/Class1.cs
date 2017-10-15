using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Answer
{
    private string p_QuestionID, p_CorrectAnswer, p_UserAnswer, p_Result;
	public string QuestionID
	{
        get { return p_QuestionID; }
        set { p_QuestionID = value; }
	}
    public string CorrectAnswer 
    {
        get{ return p_CorrectAnswer; }
        set { p_CorrectAnswer=value;}
    }
    public string UserAnswer
    {
        get { return p_UserAnswer; }
        set { p_UserAnswer = value; }
    }
    public ResultValue Result
    {
        get 
        {
        if(p_UserAnswer==p_CorrectAnswer)
        {
            return ResultValue.Correct;
        }
            else
        {
            return ResultValue.Incorrect;
        }
        }
    }
    public enum ResultValue { Correct, Incorrect }
    }

