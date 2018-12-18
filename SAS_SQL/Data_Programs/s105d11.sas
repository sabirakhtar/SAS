*** s105d11 ***;

proc sql;
select distinct Employee_Name format=$25.
       as Manager,City
   from orion.order_fact as of,  
        orion.product_dim as pd,
        orion.employee_organization as eo,
        orion.employee_addresses as ea
   where of.Product_ID=pd.Product_ID
         and of.Employee_ID=eo.Employee_ID
         and ea.Employee_ID=eo.Manager_ID 
         and Product_Name contains 'Expedition Zero' 
         and year(Order_Date)=2011
         and eo.Employee_ID ne 99999999;
quit;

