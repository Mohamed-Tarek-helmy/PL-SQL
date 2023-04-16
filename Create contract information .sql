/*this script creates a table for storing contract information and adds six sample records to it, 
demonstrating the use of different contract start/end dates, total/deposit fees, and payment types.*/

CREATE TABLE HR.CONTRACTS
(
  CONTRACT_ID            NUMBER,
  CONTRACT_STARTDATE     DATE,
  CONTRACT_ENDDATE       DATE,
  CONTRACT_TOTAL_FEES    NUMBER(10,2),
  CONTRACT_DEPOSIT_FEES  NUMBER(10,2),
  CLIENT_ID              NUMBER,
  CONTRACT_PAYMENT_TYPE  VARCHAR2(250 BYTE),
  NOTES                  VARCHAR2(4000 BYTE),
  CONSTRAINT CONTRACTS_PK
 PRIMARY KEY
 (CONTRACT_ID),
  CONSTRAINT CONTRACTS_R01 
 FOREIGN KEY (CLIENT_ID) 
 REFERENCES HR.CLIENTS (CLIENT_ID)
);
SET DEFINE OFF;
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (101, TO_DATE('01/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 500000, NULL, 
    1, 'ANNUAL', NULL);
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (102, TO_DATE('03/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/01/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 600000, 10000, 
    2, 'QUARTER', NULL);
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (103, TO_DATE('05/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('05/01/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 400000, 50000, 
    3, 'QUARTER', NULL);
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (104, TO_DATE('03/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/01/2024 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 700000, NULL, 
    2, 'MONTHLY', NULL);
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (105, TO_DATE('04/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('04/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 900000, 300000, 
    1, 'ANNUAL', NULL);
Insert into HR.CONTRACTS
   (contract_id, contract_startdate, contract_enddate, contract_total_fees, contract_deposit_fees, 
    client_id, contract_payment_type, notes)
 Values
   (106, TO_DATE('01/01/2021 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('01/01/2026 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1000000, 200000, 
    2, 'HALF_ANNUAL', NULL);
COMMIT;
