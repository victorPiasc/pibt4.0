CREATE PROCEDURE web_singleDepartment(
   pEmployerId IN  NUMBER,
   result      OUT NUMBER)
AS
BEGIN
   SELECT COUNT(*) INTO result FROM department WHERE employerId=pEmployerId;
END;