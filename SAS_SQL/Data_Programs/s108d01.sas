*** s108d01 ***;

proc sql;
describe table dictionary.dictionaries;
select memname as Table, 
       name as Column, Type
   from dictionary.dictionaries;
quit;

proc sql;
describe table dictionary.tables;
quit;


title 'Tables in the ORION Library';
proc sql;
select memname 'Table Name',
       nobs,nvar,crdate
   from dictionary.tables
   where libname='ORION';
quit;

title 'Columns in the orion.employee_addresses Table';
proc sql;
select Name,Type,Length
   from dictionary.columns
   where libname='ORION'
         and memname='EMPLOYEE_ADDRESSES';
quit;

title 'Tables Containing an Employee_ID Column';
proc sql;
select memname 'Table Names', name
   from dictionary.columns
   where libname='ORION' and 
         upcase(name)='EMPLOYEE_ID';
quit;
title;
