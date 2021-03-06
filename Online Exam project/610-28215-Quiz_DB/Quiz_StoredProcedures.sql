if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_GetQsnOptions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_GetQsnOptions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_GetQuestionPapers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_GetQuestionPapers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnCreationDetailUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnCreationDetailUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnCreationDetail_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnCreationDetail_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnCreationMaster_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnCreationMaster_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnCreationMaster_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnCreationMaster_Update]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnCreation_Details]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnCreation_Details]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnLimitMaster_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnLimitMaster_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PS_Quiz_QsnsLimitDetail_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PS_Quiz_QsnsLimitDetail_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_CheckQsnStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_CheckQsnStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_CheckQsnStatus_Del]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_CheckQsnStatus_Del]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_DeleteQsn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_DeleteQsn]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_GetQsns]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_GetQsns]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_OnlineTest_Detail_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_OnlineTest_Detail_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_OnlineTest_Master_Insert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_OnlineTest_Master_Insert]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_OnlineTest_QuestionsWithOptions_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_OnlineTest_QuestionsWithOptions_Get]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ps_Quiz_QuestionsWithOptions_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Ps_Quiz_QuestionsWithOptions_Get]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_GetQsnOptions 
@QsnId Varchar(50)  
As  
Begin  
	Select A.QsnDesc, A.NoOfOptions, A.CorrectOption, A.Marks, B.OptionValue, B.OptionOrder  
	From Quiz_tblQsnCreationMaster A, Quiz_tblQsnCreationDetail B  
	Where A.QuestionId = B.QuestionId  
 		And A.DeletionStatus = 'U' And B.DeletionStatus = 'U'  
 		And A.QuestionId = @QsnId And B.QuestionId = @QsnId  
End  

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_GetQuestionPapers --'User'      
@LogInId Varchar(50)      
As      
Begin      
 Declare @Cnt Int      
      
 Select @Cnt = Count(*)       
 From Quiz_tblOnlineTest_Master      
 Where DeletionStatus = 'U' And CreationLogInId = @LogInId      
      
 If(@Cnt = 0)      
 Begin      
   Select QsnId, QsnName      
   From Quiz_tblQsnsLimitMaster       
   Where DeletionStatus = 'U' 
 End      
 Else      
 Begin      
   Declare @DCnt Int      
       
 	Select @DCnt = Count(*)      
 	From Quiz_tblQsnsLimitMaster      
 	Where DeletionStatus = 'U'  And  QsnId Not In (Select QuesPaperId      
            						From Quiz_tblOnlineTest_Master      
            						Where DeletionStatus = 'U' And CreationLogInId = @LogInId)      
      	If(@DCnt = 0)      
  	Begin      
   		Select QsnId, QsnName      
   		From Quiz_tblQsnsLimitMaster      
   		Where DeletionStatus='U'
  	End      
  	Else      
  	Begin      
    		Select QsnId, QsnName      
    		From Quiz_tblQsnsLimitMaster      
    		Where  DeletionStatus='U'
			And QsnId Not In (Select QuesPaperId From Quiz_tblOnlineTest_Master      
        					Where DeletionStatus = 'U' And CreationLogInId = @LogInId)      
 	End      
 End      
End      
   


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

Create Procedure PS_Quiz_QsnCreationDetailUpdate  
@QuestionId Varchar(50),  
@OptionValue Varchar(500),  
@OptionOrder Varchar(50)  
As  
Begin  
 Update Quiz_tblQsnCreationDetail 
	Set OptionValue=@OptionValue  
 Where DeletionStatus='U' And QuestionId=@QuestionId And OptionOrder=@OptionOrder   
End  


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnCreationDetail_Insert    
@QuestionId Varchar(50),    
@OptionOrder Varchar(50),  
@OptionValue Varchar(500),    
@CreationloginId Varchar(50)  
As    
Begin    
                           
   Insert Into  Quiz_tblQsnCreationDetail    
   	(QuestionId, OptionValue, CreationloginId, optionorder)    
   Values    
   	(@QuestionId, @OptionValue, @CreationloginId, @OptionOrder)    
      
End

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnCreationMaster_Insert    
@QsnDesc Varchar(4000),    
@NoOfOptions Varchar(50),    
@CorrectOption Varchar(50),   
@Marks Varchar(50),   
@CreationloginId Varchar(50),    
@Output Varchar(100) Output    
As    
Begin    
     Declare @RefID Varchar(50)            
     Declare @MAXNo Int            
     Declare @Cnt int      
    
     Select @Cnt = Count(*) From Quiz_tblQsnCreationMaster    
     Where DeletionStatus='U' And QsnDesc=@QsnDesc    
     
     If(@Cnt=0)    
     Begin    
          Select  @MAXNo = IsNull(Max(Sno),0)      
          From Quiz_tblQsnCreationMaster                    
          Set @RefID = 'Qsn'+Cast((@MAXNo + 1) As Varchar(50))      
    
    	Insert Into  Quiz_tblQsnCreationMaster    
    		(QuestionId, QsnDesc, NoOfOptions, CorrectOption,  Marks, CreationloginId)    
        Values    
    		(@RefID, @QsnDesc, @NoOfOptions, @CorrectOption,  @Marks, @CreationloginId)    
    
        If(@@error<>0)            
        Begin            
           Set @Output = 'Error'            
        End            
        Else            
        Begin            
             Set @Output =  @RefID + '~'+ 'Inserted'            
        End 
   End    
   Else    
   Begin    
    	Set @Output = 'Duplicate'     
   End    
End


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnCreationMaster_Update
@QuestionId Varchar(50),      
@QsnDesc Varchar(4000),  
@CorrectOption Varchar(50),  
@Marks Varchar(50),    
@CreationLogInId Varchar(50),    
@Output Varchar(100) Output      
As      
Begin      
         Declare @Cnt int          
        
  Select @Cnt = Count(*) 
  From Quiz_tblQsnCreationMaster        
  Where DeletionStatus='U' And QsnDesc = @QsnDesc And QuestionId != @QuestionId      
         
  If(@Cnt=0)        
  Begin
   	Update Quiz_tblQsnCreationMaster      
   	Set QsnDesc=@QsnDesc, CorrectOption =  @CorrectOption, Marks = @Marks  
   	Where DeletionStatus='U' And QuestionId=@QuestionId      
       
     	If(@@error<>0)                
        Begin                
            Set @Output = 'Error'                
        End                
        Else                
        Begin                
              Set @Output = 'Inserted'                
        End         
 End      
 Else      
 Begin        
     Set @Output = 'Duplicate'         
 End    
End    


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnCreation_Details
As            
Begin            
   Select QuestionId, QCM.QsnDesc, NoOfOptions, CorrectOption,         
      		QCM.Marks       
  From Quiz_tblQsnCreationMaster QCM      
  Where DeletionStatus='U' 
End

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnLimitMaster_Insert        
@QsnName Varchar(150),    
@Durationoftest Varchar(50),    
@CreationLoginId Varchar(50),        
@Result Varchar(100) Output        
As        
Begin        
        
    Declare @RefID Varchar(50)                
    Declare @MAXNo Int                
    Declare @Cnt int          
        
    Select  @Cnt = IsNull(Max(Sno),0)          
    From Quiz_tblQsnsLimitMaster        
    Where DeletionStatus = 'U' And QsnName = @QsnName        
        
    If(@Cnt = 0)        
    Begin        
      
      Select  @MAXNo = IsNull(Max(Sno),0)          
      From Quiz_tblQsnsLimitMaster                        
                
      Set @RefID = 'Ques'+Cast((@MAXNo + 1) As Varchar(50))           
                
       Insert Into  Quiz_tblQsnsLimitMaster            
         (QsnId, QsnName, Durationoftest, CreationLoginId)        
       Values        
    (@RefID, @QsnName, @Durationoftest, @CreationLoginId)        
         
       If(@@error<>0)                
       Begin                
    Set @Result = 'Error'                
       End                
       Else                
       Begin                
    Set @Result = 'Success'+'~'+@RefID             
       End         
    End         
    Else        
    Begin        
  Set @Result = 'Duplicate'                
    End        
End    


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure PS_Quiz_QsnsLimitDetail_Insert  
@QsnId Varchar(150),  
@QsnsManual  Varchar(8000),  
@CreationLoginId Varchar(50)  
As  
Begin  
                 
         Insert Into  Quiz_tblQsnsLimitDetail      
    		(QsnId, QsnsManual,  CreationLoginId)  
  	 Values  
    		(@QsnId, @QsnsManual, @CreationLoginId)      
End


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_CheckQsnStatus      
@QsnId Varchar(50),      
@Status Varchar(50) Output      
As      
Begin      
    Declare @Cnt Int      
   
   Select @Cnt = Count(*)         
   From (Select * 
	From FN_Question_Answers('')) Vw1
   Where Vw1.QuestionIds = @QsnId   
--   Select @Cnt = Count(*)       
--   From WFM_tblScreening_Detail      
--   Where QsnId = @QsnId      
      
  If(@Cnt > 0)      
  Begin      
    Set @Status = 'DontUpdates'       
  End      
  Else      
  Begin      
    Set @Status = 'Upd'      
  End      
End      
    
  


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_CheckQsnStatus_Del        
@QsnId Varchar(50),        
@Status Varchar(50) Output        
As        
Begin        
      Declare @Cnt Int        
      Select @Cnt = Count(*)         
  	From (Select * 
		From FN_Question_Answers('')) Vw1
	Where Vw1.QuestionIds = @QsnId
        
     If(@Cnt > 0)        
  Begin        
     Set @Status = 'DontUpdates'         
  End        
     Else        
  Begin        
     Set @Status = 'Upd'        
  End        
End        
  


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_DeleteQsn  
@QsnId Varchar(50),      
@LogInId Varchar(50),  
@Status Varchar(50) Output      
As      
Begin      
    Declare @Cnt Int      
      
 Update Quiz_tblQsnCreationMaster  
 Set DeletionStatus = 'D', DeletionDate = GetDate(), DeletionLogInId = @LogInId  
 Where QuestionId = @QsnId  
  
 Update Quiz_tblQsnCreationDetail  
 Set DeletionStatus = 'D', DeletionDate = GetDate(), DeletionLogInId = @LogInId  
 Where QuestionId = @QsnId  
      
 If(@Cnt > 0)      
 Begin      
   Set @Status = 'Error'       
 End      
 Else      
 Begin      
   Set @Status = 'Success'      
 End      
End   

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_GetQsns   
As    
Begin    
 Select QuestionId, QsnDesc, Marks  
 From Quiz_tblQsnCreationMaster    
 Where DeletionStatus = 'U'  
End    


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

Create Procedure Ps_Quiz_OnlineTest_Detail_Insert
@AssesmentId	varchar(50),
@QsnId		varchar(50),
@CorrectAns varchar(50),
@UserAns	varchar(50),
@Marks	varchar(50),
@UserMarks	varchar(50),
@CreationLogInId varchar(50)
As
Begin
	Insert Into Quiz_tblOnlineTest_Detail
		(AssesmentId, QsnId, CorrectAns, UserAns, Marks, UserMarks, CreationLogInId)
	Values
		(@AssesmentId, @QsnId, @CorrectAns, @UserAns, @Marks, @UserMarks, @CreationLogInId)
	
End

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

Create Procedure Ps_Quiz_OnlineTest_Master_Insert
@QuesPaperId	varchar(50),
@ActualTimeLimit varchar(50),
@UserTimeLimit	varchar(50),
@TotalScore	varchar(50),
@UserScore	varchar(50),
@Percentage	varchar(50),
@CreationLogInId varchar(50),
@Status Varchar(50) Output
As
Begin
	Declare @RefID Varchar(50)                
    	Declare @MAXNo Int                
    	
    	Select  @MAXNo = IsNull(Max(Sno),0)          
    	From Quiz_tblOnlineTest_Master        
    	Where DeletionStatus = 'U'

	Set @RefID = 'Assmt'+Cast((@MAXNo + 1) As Varchar(50))

	Insert Into Quiz_tblOnlineTest_Master
		(AssesmentId, QuesPaperId, ActualTimeLimit, UserTimeLimit, TotalScore, UserScore, Percentage,
			CreationLogInId)
	Values
		(@RefID, @QuesPaperId, @ActualTimeLimit, @UserTimeLimit, @TotalScore, @UserScore, @Percentage,
			@CreationLogInId)

	If(@@Error<>0)                
       	Begin                
    		Set @Status = 'Error'                
       	End                
       	Else                
       	Begin                
    		Set @Status = 'Success'+'~'+@RefID             
       	End  
End



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_OnlineTest_QuestionsWithOptions_Get --'Ques1'
@Ques Varchar(8000)
As        
Begin        
    Select A.QuestionId, A.QsnDesc, A.CorrectOption, B.OptionValue, A.Marks,
	(Select QsnName From Quiz_tblQsnsLimitMaster
		Where QsnId = @Ques) QuesPaper,
	(Select Durationoftest From Quiz_tblQsnsLimitMaster
		Where QsnId = @Ques) QuesPaper
    From Quiz_tblQsnCreationMaster A, Quiz_tblQsnCreationDetail B        
    Where A.QuestionId = B.QuestionId  And        
    		A.QuestionId In (Select QuestionIds From FN_Question_Answers_Quiz(@Ques)) 
		And B.QuestionId In (Select QuestionIds From FN_Question_Answers_Quiz(@Ques))  
   Order By A.QuestionId, B.OptionOrder            
End    


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE Procedure Ps_Quiz_QuestionsWithOptions_Get 
@QsnIds Varchar(4000)        
As        
Begin        
    Declare @WhereCondition varchar(4000)        
    Declare @Tmp nvarchar(4000)        
    Set @WhereCondition = 'Select A.QuestionId, A.QsnDesc, A.CorrectOption,        
                		B.OptionValue, A.Marks        
                    From Quiz_tblQsnCreationMaster A, Quiz_tblQsnCreationDetail B        
                    Where A.QuestionId = B.QuestionId  And        
    A.QuestionId In ('+@QsnIds+') And B.QuestionId In ('+@QsnIds+')  
    Order By A.QuestionId, B.OptionOrder'       
   Print  @WhereCondition      
   Select @Tmp=cast(@WhereCondition as nvarchar(4000))        
   Execute Sp_ExecuteSql @Tmp           
End    

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

