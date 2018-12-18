*** s108a01 ***;

title;
options ls=80; 
proc sql number outobs=10;
title "Top 10 Employee's 2011 Charitable Donations";
select Employee_Name, Sum(Qtr1,Qtr2, Qtr3,Qtr4) as Donation_Total
   from orion.employee_addresses as a,
        orion.employee_donations as d
   where a.Employee_ID=d.Employee_ID
   order by Donation_Total desc, Employee_Name;
  /*****************************************************
   Add a line of code below that TURNS OFF the row 
   numbering and changes the number of rows output to 9
   without re-invoking PROC SQL
  *****************************************************/

title "Top 9 Employee's 2011 Charitable Donations";
select Employee_Name, Sum(Qtr1,Qtr2, Qtr3,Qtr4) as Donation_Total
   from orion.employee_addresses as a,
        orion.employee_donations as d
   where a.Employee_ID=d.Employee_ID
   order by Donation_Total desc, Employee_Name;
quit;
title;

