proc sort data=orion.customer(keep=CustomerID BirthDate
                        CustomerName)out=customer;
   by descending BirthDate;
run;

data agegroups;
   keep CustomerID CustomerName BirthDate Age Description;
   set customer;
   Age=int(yrdif(BirthDate, '01Jan2012'd, 'AGE'));
   do while (not (FirstAge le Age lt LastAge));
     set orion.agesmod;
   end;
run;

proc print data=agegroups noobs;
where description='60-75 years';
   title  'Highest Age Category';
run;

title;
