*** s106s08 ***;

proc sql number;
title 'Sales Reps Who Made No Sales in 2011';
select Employee_ID, Employee_Name 
   from orion.employee_addresses
   where Employee_ID in 
      (select Employee_ID 
          from orion.sales
          where Job_Title like '%Rep%'
	   except all
       select Employee_ID 
          from orion.order_fact
	      where year(Order_Date)=2011);
quit;
title;
