*** s103s03 ***;  

proc sql; 
title "US Customers >50 Years Old as of 02FEB2013";
select Customer_ID format=z7. 'Customer ID',
       catx(', ',Customer_LastName,Customer_FirstName)
            format=$20. 'Last Name, First Name' as Name, 
       Gender 'Gender',
       int(('02feb2013'd-Birth_Date)/365.25) as Age
   from orion.customer
   where Country="US" and
         calculated Age>50
   order by Age desc, Name;
quit;
title;
