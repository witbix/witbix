DELIMITER //
 DROP PROCEDURE IF EXISTS mysql.replica_setup//
 CREATE PROCEDURE mysql.replica_setup(IN `repl_user` VARCHAR(255),IN `repl_pass` VARCHAR(255))
 BEGIN
    SET @grantSql = CONCAT ("GRANT REPLICATION SLAVE ON *.* to '", repl_user, "'@'%' IDENTIFIED BY '", repl_pass, "';");
    SET @slaveSql = CONCAT ("CHANGE MASTER TO MASTER_USER='", repl_user, "', MASTER_PASSWORD='", repl_pass, "';");

    PREPARE stmt FROM @grantSql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    PREPARE stmt FROM @slaveSql;
    IF ((select VARIABLE_VALUE from information_schema.GLOBAL_STATUS where VARIABLE_NAME = 'slave_running')='ON' OR (select VARIABLE_VALUE from information_schema.GLOBAL_STATUS where VARIABLE_NAME = 'slaves_running')=1) THEN
        STOP SLAVE;
        EXECUTE stmt;
        START SLAVE;
      ELSE
        EXECUTE stmt;
    END IF;
    DEALLOCATE PREPARE stmt;
 END //
DELIMITER ;