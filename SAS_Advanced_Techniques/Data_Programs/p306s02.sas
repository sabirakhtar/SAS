data emps;
   length StateName $ 12 CountryName $30;
   keep EmployeeID Country CountryName StateName;
   if _N_=1 then do;
      declare hash C();
      C.definekey('State', 'Country');
      C.definedata('StateName', 'CountryName');
      C.definedone();
      C.add(key:'FL', key:'US', data:'Florida', data:'United States');
      C.add(key:'PA', key:'US', data:'Pennsylvania', data:'United States');
      C.add(key:'CA', key:'US', data:'California', data:'United States');
      C.add(key:' ', key:'AU', data:' ', data:'Australia');
      call missing(StateName, CountryName);
   end;
   set orion.employeeaddresses;
   rc=C.find(key:upcase(State), key:upcase(Country));
   if rc=0; 
run;

proc print data=emps(obs=5) noobs ;
   title 'emps Data Set';
run;

title;

