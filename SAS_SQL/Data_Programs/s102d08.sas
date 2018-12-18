*** s102d08 ***;

proc sql;  
select Job_Title, Salary
   from orion.employee_information;
quit;

 /* Standard Form */
proc sql;
select Job_Title, Salary,
       case
          when scan(Job_Title,-1,' ')='I' 
               then Salary*.05 
          when scan(Job_Title,-1,' ')='II' 
               then Salary*.07 
          when scan(Job_Title,-1,' ')= 'III' 
               then Salary*.10
          when scan(Job_Title,-1,' ')= 'IV' 
               then Salary*.12 
          else Salary*.08
       end as Bonus
   from orion.employee_information;
quit;

 /* Shortcut Form */
proc sql;
select Job_Title, Salary, 
       case  scan(Job_Title,-1,' ')
          when 'I' then Salary*.05 
          when 'II' then Salary*.07 
          when 'III' then Salary*.10
          when 'IV' then Salary*.12 
          else Salary*.08
       end as Bonus
   from orion.employee_information;
quit;




