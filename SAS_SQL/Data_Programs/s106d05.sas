*** s106d05 ***;

data work.admin_I work.admin_II work.admin_III work.admin_IV;
   set orion.staff(keep=Employee_ID Job_Title Salary 
                   where=(Job_Title contains 'Secretary' or 
                          Job_Title contains 'Office A'));
   level=scan(Job_Title,-1,' ');
   if level = 'I' then output work.admin_I;
   else if level='II' then output work.admin_II;
   else if level='III' then output work.admin_III;
   else output admin_IV;
   drop level;
run;

proc sql;
select *
   from work.admin_I
outer union corr
select *
   from work.admin_II
outer union corr
select *
   from work.admin_III
outer union corr
select * 
   from work.admin_IV;
quit;

