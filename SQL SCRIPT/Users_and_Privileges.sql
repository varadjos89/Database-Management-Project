-- -----------------------------------------------------
-- CREATING USERS
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS creating_users;-- 
DELIMITER $$
CREATE PROCEDURE creating_users(IN name VARCHAR(45), IN password VARCHAR(45))
BEGIN
    
    SET @username = name;
    SET @pass = password;
    
	SET @query1 = CONCAT('
        CREATE USER "',@username,'"@"localhost" IDENTIFIED BY "',@pass,'" '
        );
    PREPARE stmt FROM @query1; 
    EXECUTE stmt; 
    DEALLOCATE PREPARE stmt;

    SET @query1 = CONCAT('
    GRANT ALL ON iss.* TO "',@username,'"@"localhost"');
    PREPARE stmt FROM @query1;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END $$
DELIMITER ;

CALL creating_users('MURALI','1234');


