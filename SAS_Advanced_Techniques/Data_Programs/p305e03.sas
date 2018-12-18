 /* PROC SORT starter code*/
proc sort data=orion.orderfact 
           out=orderfact(keep=CustomerID OrderType OrderDate DeliveryDate Quantity);
   where CustomerID in (89, 2550) 
     and year(OrderDate)=2011; 
   by OrderType;
run;

proc sql;
   title 'Count by Order Type';
   select OrderType, 
          count(*) as count
      from orderfact
         group by OrderType;
quit;

 /*  All SQL starter code */
 /*
proc sql;
   create table orderfact as
      select CustomerID,
		       OrderType,
             OrderDate,
             DeliveryDate,
             Quantity
	      from orion.orderfact
	         where CustomerID in (89, 2550) 
              and year(OrderDate)=2011
		         order by OrderType;
   title 'Count by Order Type';
   select OrderType, 
          count(*) as count
      from orderfact 
         group by OrderType;
quit;
 */

title;
