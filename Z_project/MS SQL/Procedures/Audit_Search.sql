
CREATE PROC [dbo].[Audit_Search]
   @pClue     NVARCHAR(256),
   @StartDate DATETIME,
   @EndDate   DATETIME
AS
BEGIN
   SELECT a.[LogId],
         a.[UserName],
         wec.[EventCode],
         a.[EventDetails],
         a.[EventTime],
         a.[FromIP]
      FROM [Audit] a
      LEFT JOIN WebEventCode wec ON
         a.EventCode=wec.Id
      WHERE a.EventTime BETWEEN ISNULL(@StartDate,'1753-01-01') AND ISNULL(@EndDate,'9999-12-31') AND
         (  @pClue='' OR
            UPPER(wec.[EventCode]) LIKE '%'+UPPER(@pClue)+'%' OR
            UPPER(a.[UserName]) LIKE '%'+UPPER(@pClue)+'%' OR
            UPPER(a.[EventDetails]) LIKE '%'+UPPER(@pClue)+'%')
      ORDER BY a.[EventTime] DESC
END
