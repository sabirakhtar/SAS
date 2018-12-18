*** s103s08 ***;  
proc sql;
title "Countries and Cities Where Employees Live";
select upcase(Country) 'Country', 
       propcase(City) 'City',
       count(*) 'Employees'
   from orion.employee_addresses
   group by 1,2
   order by 1,2;
quit;
title;

  /*****************************************************
   INCORRECT SOLUTION FOLLOWS
   Demonstrates that, without aliases the output will 
   contain duplicates.
  *****************************************************/
proc sql;
title "Countries and Cities Where Employees Live";
title2 "Incorrect Solution: Improper grouping due to Case issues";
title3 "Even with DISTINCT specified, duplicates remain";
select distinct upcase(Country), 
       propcase(City),
       count(*) 'Employees'
   from orion.employee_addresses
   group by country, city
   order by country, city;
quit;
title;
