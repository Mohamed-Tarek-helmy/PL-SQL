/*This is a SQL script that creates a sequence named "INSTALLMENTS_PAID_SEQ" in the schema "HR".
The sequence is used to generate unique values for the "INSTALLMENT_ID" column in the "INSTALLMENTS_PAID" table.*/



CREATE SEQUENCE HR.INSTALLMENTS_PAID_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999;
  
  
  
