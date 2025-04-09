CREATE DATABASE DEMO;
USE DEMO;
SHOW DATABASES;
SHOW TABLES;
---------Create_command 
CREATE TABLE ACCOUNTS
(
ACC_NO BIGINT PRIMARY KEY,
ACC_HOLDER_NAME VARCHAR(20) NOT NULL,
PHONE_NO BIGINT UNIQUE NOT NULL CHECK(length(PHONE_NO)=10),
MAIL VARCHAR(20) UNIQUE,
GENDER ENUM("MALE", "FEMALE", "OTHERS"),
NATIONALITY VARCHAR(30) default "INDIAN"
);

SHOW TABLES;
DESC ACCOUNTS;


create TABLE BRANCH(
BRANCH_ID INT PRIMARY KEY auto_increment,
B_NAME VARCHAR(20) NOT NULL,
AREA VARCHAR(20) NOT NULL UNIQUE,
CITY VARCHAR(30) default 'BANGALORE');

DESC BRANCH;

------2nd_class _Alter_table
-----ADD_COLUMN
use demo;
ALTER TABLE ACCOUNTS
ADD B_ID INT NULL;

ALTER TABLE BRANCH
ADD IFSC_CODE VARCHAR(20) UNIQUE CHECK(length(IFSC_CODE)=15);

ALTER TABLE BRANCH DROP IFSC_CODE;

ALTER TABLE BRANCH 
ADD IFSC_CODE VARCHAR(20) UNIQUE CHECK(length(IFSC_CODE)=15) AFTER B_NAME;


------DROP_COLUMN
ALTER TABLE ACCOUNTS
DROP NATIONALITY;

---tO_MODIFY_THE_DATTYPE
alter table BRANCH 
MODIFY CITY CHAR(10);

ALTER TABLE ACCOUNTS
MODIFY ACC_HOLDER_NAME CHAR(10) NOT NULL;

DESC ACCOUNTS;
DESC BRANCH;

---TO_MODIFY_NULL/NOTNULL
ALTER TABLE ACCOUNTS
MODIFY MAIL VARCHAR(20) NOT NULL

ALTER TABLE BRANCH
MODIFY B_NAME VARCHAR(20) NULL;

DESC ACCOUNTS;
DESC BRANCH;

---TO_CHANGE_COLUMN_NAME
ALTER TABLE ACCOUNTS
CHANGE ACC_HOLDER_NAME NAME CHAR(10) NULL;

DESC ACCOUNTS;

ALTER TABLE BRANCH 
CHANGE CITY DISTRICT VARCHAR(30);
DESC BRANCH;

--CHANGE/RENAME_TABLE_NAME
ALTER TABLE BRANCH 
RENAME SBI_BRANCH;

DESC BRANCH; --ERROR
DESC SBI_BRANCH;

--ADD_FORIEN_KEY
ALTER TABLE ACCOUNTS
ADD CONSTRAINT FOREIGN KEY(B_ID) REFERENCES SBI_BRANCH(BRANCH_ID);
DESC ACCOUNTS;

--to_remove_the_primary_key
alter table accounts
DROP PRIMARY KEY;

DESC ACCOUNTS;

alter TABLE SBI_BRANCH
DROP PRIMARY KEY;  --ERROR DUE_TO_FOREIGN_KEY_CONSTRAINT


--TO REMOVE_UNIQUE_CONSTRAINT
ALTER TABLE ACCOUNTS
DROP INDEX  PHONE_NO;

DESC ACCOUNTS;

--TO_REMOVE_THE_FOREIGNKEY_AND_CHECK_CONSTRAINT
ALTER TABLE ACCOUNTS
DROP CONSTRAINT accounts_ibfk_1;   
      (--FOR-FOREIGN-KEY==--IT_IS_A_CONSTRAINT_NAME_FROM_THE_TABLEcONTSRAINTS_INFORMATIONsCHEMA)

DESC ACCOUNTS;   (--FOREIGN_KEY-REMOVED FROM_THEACCOUNTS_TABLE)

ALTER TABLE SBI_BRANCH
DROP CONSTRAINT sbi_branch_chk_1;
       (--FOR-CHECK-CONSTRAINT==--IT_IS_A_CONSTRAINT_NAME_FROM_THE_TABLEcONTSRAINTS_INFORMATIONsCHEMA)
DROP TABLE SBI_BRANCH;

DESC SBI_BRANCH;

DROP TABLE ACCOUNTS;