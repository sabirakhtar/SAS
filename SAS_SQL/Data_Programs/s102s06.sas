*** s102s06 ***;

proc sql; 
select Employee_ID, Recipients,  
       sum(Qtr1,Qtr2,Qtr3,Qtr4) as Total
   from orion.employee_donations
   where calculated Total>90;    
quit;

 
