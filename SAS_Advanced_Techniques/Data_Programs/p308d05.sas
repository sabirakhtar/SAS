/*create the $postabb format*/
 proc format;
   value $postabb  
        '1000'-'1999', '2000'-'2599', 
        '2619'-'2898', '2921'-'2999'='NSW'
        '0200'-'0299', '2600'-'2618',
        '2900'-'2920'               ='ACT'
        '3000'-'3999', '8000'-'8999'='VIC'
        '4000'-'4999', '9000'-'9999'='QLD'
        '5000'-'5799', '5800'-'5999'='SA'
        '6000'-'6797', '6800'-'6999'='WA'
        '7000'-'7799', '7800'-'7999'='TAS'
        '0800'-'0899', '0900'-'0999'='NT';
run;

/*define the function that uses the format*/
proc fcmp outlib=orion.functions.char;
   function StateProv(Country $,Code $) $ 4;
	   if upcase(country) ='AU' then stpr=put(code,$postabb.);
	   else if upcase(country)='US' then stpr=zipstate(code);
	   else stpr=' ';
      return(stpr);
   endsub;
quit;


/*use the function in PROC SQL*/
options cmplib=orion.functions;

title 'Employees with State/Province Codes';

proc sql;
 select Country,
        PostalCode,
        StateProv(Country,PostalCode) 'State/Province',
        EmployeeID,
        EmployeeName
 from orion.employeeaddresses
 order by Country, EmployeeName;
quit;
title;

