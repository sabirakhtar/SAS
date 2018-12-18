proc sort data=orion.customer(keep=CustomerID BirthDate
                        CustomerName)out=customer;
   by descending BirthDate;
run;

/*add DATA step and PROC print code here*/
