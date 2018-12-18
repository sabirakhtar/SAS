*** s107a02 ***;


proc sql;
create view orion.customer as
    select Customer_Name, Birth_Date, 
           Customer_Type_ID
    from orion.customer;
quit;
