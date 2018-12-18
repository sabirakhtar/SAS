proc sort data=orion.orderfact 
           out=orderfact(keep=CustomerID OrderType OrderDate DeliveryDate Quantity);
   where CustomerID in (89, 2550) and year(OrderDate)=2011; 
   by OrderType;
run;

proc sql;
   title 'Count by Order Type';
   select OrderType, 
          count(*) as count
      from orderfact
         group by OrderType;
quit;

data all;
   array ordt{*} OrderedDate1-OrderedDate4;
   array deldt{*} DeliveryDate1-DeliveryDate4;
   array q{*} Quantity1 - Quantity4;
   format OrderedDate1-OrderedDate4 DeliveryDate1-DeliveryDate4 date9.;
   N=0;  
   do until (last.OrderType);
      set orderfact;
      by OrderType;
      N+1;
      ordt{N}=OrderDate;
      deldt{N}=DeliveryDate;
      q{N}=Quantity;
   end;
run;

proc print data=all;
  title 'The ALL Data Set';
run;

title;

 /*  A more dynamic solution */	
 /*
options symbolgen; 

proc sort data=orion.orderfact 
           out=orderfact(keep=CustomerID OrderType OrderDate DeliveryDate Quantity);
   where CustomerID in (89, 2550) and year(OrderDate)=2011; 
   by OrderType;
run;


proc sql noprint;                                                            
  create table temp as                                               
     select count(*) as Num                                          
        from orderfact                                              
        group by OrderType;                                     
  select max(Num) into :NumObs                                   
        from temp;
%let NumObs=&NumObs;
quit; 

data all;
   array ordt{*} OrderedDate1-OrderedDate&NumObs;
   array deldt{*} DeliveryDate1-DeliveryDate&NumObs;
   array q{*} Quantity1 - Quantity&NumObs;
   format OrderedDate1-OrderedDate&NumObs 
          DeliveryDate1-DeliveryDate&NumObs 
		  date9.;
   N=0;                                                                                                 
   do until (last.OrderType);
      set orderfact;
      by OrderType;
      N+1;
      ordt{N}=OrderDate;
      deldt{N}=DeliveryDate;
      q{N}=Quantity;
   end;
run;

proc print data=all;
  title 'The ALL Data Set';
run;

title;
options nosymbolgen;
 */



