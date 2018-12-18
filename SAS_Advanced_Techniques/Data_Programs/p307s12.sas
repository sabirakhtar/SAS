data agegroups;
   keep CustomerID CustomerName Age Description;
   if _N_=1 then do;
      if 0 then set orion.agesmod;
      declare hash AG(dataset: 'orion.agesmod', ordered: 'ascending');
      AG.defineKey('FirstAge');
      AG.defineData('FirstAge', 'LastAge', 'Description');
      AG.defineDone();
      declare hiter A('AG');
   end;
   set orion.customer(keep=CustomerID BirthDate CustomerName); 
   Age=int(yrdif(BirthDate, '01Jan2012'd, 'AGE'));
   A.first();
   do until (rc ne 0);
      if FirstAge <= Age < LastAge then do;
         output;
         leave;
      end;
      else if FirstAge > Age then leave;
      rc=A.next();
   end;
run;

proc print data=agegroups(obs=5) noobs;
   title  'agegroups';
run;

title;









