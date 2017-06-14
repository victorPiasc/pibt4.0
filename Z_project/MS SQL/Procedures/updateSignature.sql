BEGIN 
	IF(EXISTS(SELECT signatureImage FROM signatures WHERE signatureId=@signatureId))
		UPDATE signatures 
		SET signatureImage=@signatureImage 
		WHERE signatureId=@signatureId;
	ELSE 
		INSERT INTO signatures(signatureId, signatureImage)
		VALUES (@signatureId, @signatureImage);
END