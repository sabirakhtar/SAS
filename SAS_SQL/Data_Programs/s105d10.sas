*** s105d10 ***;

proc sql;
select Employee_Name format=$25. as Name, City
   from orion.employee_addresses
   where Employee_ID in
      /* Subquery - List managers' Employee_IDs */
     (select Manager_ID 
         from orion.employee_organization as o,
      /* In-line View - Employees who sold 
	       Expedition Zero mechandise */
         (select distinct Employee_ID
             from orion.order_fact as of, 
                  orion.product_dim as p
             where of.Product_ID=p.Product_ID
                   and year(Order_Date)=2011 
                   and Product_Name contains 'Expedition Zero' 
                   and Employee_ID ne 99999999) as ID
              /* End In-line View */  
         where o.Employee_ID=ID.Employee_ID);
		     /* End Subquery */
quit;
