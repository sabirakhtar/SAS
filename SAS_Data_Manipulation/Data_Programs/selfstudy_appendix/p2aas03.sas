proc transpose data=orion.orders_qtr1 
               out=qtr1 (rename=(col1=Sale_Amt))	
               name=Month;
   by customer_id;
run;

proc print data=qtr1;
run;


