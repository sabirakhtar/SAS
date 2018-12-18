/* Create the ReverseName function */
proc fcmp outlib=orion.functions.dev;
 function ReverseName(name $) $ 40;
    return(catx(' ',scan(name,2,','),scan(name,1,',')));
 endsub;
quit;

/* Use the ReverseName function */
options cmplib=orion.functions;

data work.emplist;
 set orion.employeeaddresses;
  FMLName=ReverseName(EmployeeName);
 keep EmployeeId EmployeeName FMLName;
run;

title 'Reverse Names Function in a Data Step';
proc print data=work.emplist;
run;

/*conditionally executing the return statement*/
proc fcmp outlib=orion.functions.dev;
   function ReverseName(name $, gender $) $ 40;
         if gender='F' then return(catx(' ','Ms.',scan(name,2,','),scan(name,1,',')));
    else if gender='M' then return(catx(' ','Mr.',scan(name,2,','),scan(name,1,',')));
    else                    return(catx(' ',scan(name,2,','),scan(name,1,',')));
   endsub;
quit;

data work.salesstaff;
 set orion.salesstaff;
  FMLName=ReverseName(EmployeeName, Gender);
 keep EmployeeId EmployeeName FMLName Gender;
run;

title 'conditional return';
proc print data=work.salesstaff;
run;
