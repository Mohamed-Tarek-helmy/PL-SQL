

declare
        cursor contracts_cursor is
            select * from contracts;
            v_installments_count number(2);
            v_installment_date date;
            v_counter number(3);
begin
     for contracts_record in contracts_cursor loop
              -- my inputs [ start date, end date, total fees, cont type ] , convert cont type to number 1, 3, 6, 12
                if contracts_record.contract_payment_type = 'ANNUAL' then
                                v_installments_count := 12;
                elsif contracts_record.contract_payment_type = 'HALF_ANNUAL' then
                                v_installments_count := 6;
                elsif contracts_record.contract_payment_type = 'QUARTER' then
                                  v_installments_count := 3;
                elsif contracts_record.contract_payment_type = 'MONTHLY' then
                                v_installments_count := 1;
                end if;
               dbms_output.put_line(contracts_record.contract_id||' '||v_installments_count);
                    v_installment_date := contracts_record.contract_startdate;          
                        v_counter := 0;
                  Loop -- nested loop to insert installments upon each contract
                         insert into installments_paid
                                            (INSTALLMENT_ID, CONTRACT_ID, INSTALLMENT_DATE, INSTALLMENT_AMOUNT, PAID)
                                       values
                                            (INSTALLMENTS_PAID_SEQ.nextval, contracts_record.contract_id,
                                                           v_installment_date,    0,   0);   
                                         -- increment installment date by installment type
                                    v_installment_date := add_months(v_installment_date,  v_installments_count);
                                    v_counter := v_counter + 1;
                                  if v_installment_date = contracts_record.contract_enddate then
                                           exit;    --- exit inner loop if we reach the end date [ last installment ]
                                   end if;                         
                            end Loop;      
                           -- we should update here the installment fees after calculating the counter
                           update installments_paid
                            set  INSTALLMENT_AMOUNT = (contracts_record.contract_total_fees
                                                    - nvl(contracts_record.contract_deposit_fees,0) ) / v_counter
                            where contract_id = contracts_record.contract_id;
     end loop;
end;
