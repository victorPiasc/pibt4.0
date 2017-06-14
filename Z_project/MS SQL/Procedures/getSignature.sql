BEGIN 
SELECT signatureImage FROM signatures WHERE signatureId=@signatureId;
END