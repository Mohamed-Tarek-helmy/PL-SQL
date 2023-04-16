# PL-SQL

This is a PL/SQL Project  that uses a cursor to loop through each record in the "contracts" table and generates installment records 
in the "installments_paid" table for each contract based on its payment type and start/end dates.

The code block begins by declaring a cursor named "contracts_cursor" that selects all records from the "contracts" table. It also declares some variables 
to be used later in the code block.

Next, the code block loops through each record in the "contracts_cursor" using a "for" loop. For each contract,
it determines the number of installments to be generated based on the contract's payment type (annual, half-annual, quarterly, or monthly) 
and sets the "v_installments_count" variable accordingly. It then outputs the contract ID and installment count using the "dbms_output.put_line" statement.

The code block then initiates a nested loop to insert installment records into the "installments_paid" table for each contract.
It starts by setting "v_installment_date" to the contract's start date and "v_counter" to 0.
It then inserts a new record into the "installments_paid" table with the installment ID generated from the "INSTALLMENTS_PAID_SEQ" sequence
and the contract ID, installment date, installment amount (set to 0 for now), and paid status (also set to 0 for now).

In the nested loop, the code block increments the installment date based on the payment type using the "add_months" function and increments "v_counter" by 1.
It then checks if the installment date has reached the contract's end date and exits the inner loop if so.

After the nested loop, the code block updates the installment amount for each record in the "installments_paid" table for the current contract.
It calculates the installment amount by subtracting the contract's deposit fees (if any) from the total fees and dividing the result 
by the number of installments. It then updates the installment amount for all records with the same contract ID.
