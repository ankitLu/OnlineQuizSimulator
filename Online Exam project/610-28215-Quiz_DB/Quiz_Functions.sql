if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FN_Question_Answers]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FN_Question_Answers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FN_Question_Answers_Quiz]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FN_Question_Answers_Quiz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FN_SplitData]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FN_SplitData]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION FN_Question_Answers(@prmQuizId VARCHAR(8000))
RETURNS
@RET_TBL_Question_Answers TABLE (
QuestionIds	VARCHAR(500)
)
AS
--SELECT * FROM FN_Question_Answers ()
BEGIN
	DECLARE
	@QsnsManual		AS VARCHAR(8000)	

	DECLARE	curUser_Quiz CURSOR FOR 
	SELECT QsnsManual
	FROM Quiz_tblQsnsLimitDetail
	
	OPEN curUser_Quiz

	FETCH NEXT FROM curUser_Quiz INTO @QsnsManual

	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO	@RET_TBL_Question_Answers
			SELECT 		View0.Question
			FROM 
			(SELECT Q.Item AS Question, A.Item AS Answer
			  FROM 
				FN_SplitData (@QsnsManual, ',') Q
			 INNER JOIN
				FN_SplitData (@QsnsManual, ',') A
                         ON Q.Item_Index = A.Item_Index) AS View0
		
			FETCH NEXT FROM curUser_Quiz INTO @QsnsManual
		END

	CLOSE curUser_Quiz
	DEALLOCATE curUser_Quiz
	RETURN
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION FN_Question_Answers_Quiz(@prmQuizId VARCHAR(8000))
RETURNS
@RET_TBL_Question_Answers TABLE (
QuestionIds	VARCHAR(500)
)
AS
--SELECT * FROM FN_Question_Answers ()
BEGIN
	DECLARE
	@QsnsManual		AS VARCHAR(8000)	

	DECLARE	curUser_Quiz CURSOR FOR 
	SELECT QsnsManual
	FROM Quiz_tblQsnsLimitDetail
	Where QsnId = @prmQuizId
	OPEN curUser_Quiz

	FETCH NEXT FROM curUser_Quiz INTO @QsnsManual

	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO	@RET_TBL_Question_Answers
			SELECT 		View0.Question
			FROM 
			(SELECT Q.Item AS Question, A.Item AS Answer
			  FROM 
				FN_SplitData (@QsnsManual, ',') Q
			 INNER JOIN
				FN_SplitData (@QsnsManual, ',') A
                         ON Q.Item_Index = A.Item_Index) AS View0
		
			FETCH NEXT FROM curUser_Quiz INTO @QsnsManual
		END

	CLOSE curUser_Quiz
	DEALLOCATE curUser_Quiz
	RETURN
END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION FN_SplitData (
@prmDataString		VARCHAR(8000),
@prmSeparator		VARCHAR(8000))
RETURNS
@tblDataTable TABLE (
Item_Index	NUMERIC(18,0),
Item		VARCHAR(8000))
AS
--SELECT * FROM FN_SplitData ('Deepak,Prince', ',')
BEGIN
	DECLARE
	@sData		VARCHAR(8000),
	@iCharCounter	INT,
	@iItemCounter	INT
	
	SET @sData 		= ''
	SET @iCharCounter 	= 1
	SET @iItemCounter 	= 0
	
	WHILE @iCharCounter <= DATALENGTH(@prmDataString)
 	BEGIN
	     IF CHAR(ASCII(SUBSTRING(@prmDataString, @iCharCounter, 1))) <> @prmSeparator
		SET @sData = @sData + SUBSTRING(@prmDataString, @iCharCounter, 1)
	     ELSE
		BEGIN
			SET @iItemCounter = @iItemCounter + 1
			INSERT @tblDataTable SELECT @iItemCounter, LTRIM(RTRIM(@sData))
			SET @sData = ''
		END
		SET @iCharCounter = @iCharCounter + 1
	END
	SET @iItemCounter = @iItemCounter + 1
	INSERT @tblDataTable SELECT @iItemCounter, LTRIM(RTRIM(@sData))
	RETURN
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

