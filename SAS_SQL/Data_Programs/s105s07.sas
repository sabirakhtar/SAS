*** s105s07 ***;

proc sql;
title "2011 Total Sales Figures";
select catx(' ',scan(mgr.Employee_Name,2,','), 
            scan(mgr.Employee_Name,1,',')) format=$27. 
       as Manager,
       catx(' ',scan(emp.Employee_Name,2,','), 
            scan(emp.Employee_Name,1,',')) format=$27. 
       as Employee,
       Sum(Total_Retail_Price) format=comma9.2
       as Total_Sales 
   from orion.order_fact as order,  
        orion.employee_organization as org,
        orion.employee_addresses as emp,
        orion.employee_addresses as mgr
   where order.Employee_ID=org.Employee_ID
     and order.Employee_ID=emp.Employee_ID
     and mgr.Employee_ID=org.Manager_ID 
     and year(Order_Date)=2011
     and order.Employee_ID ne 99999999
   group by mgr.Country, mgr.Employee_Name, emp.Employee_Name
   order by mgr.Country, mgr.Employee_Name, Total_Sales desc;
quit;
title;
