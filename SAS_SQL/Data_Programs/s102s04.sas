*** s102s04 ***;

proc sql;
select Employee_ID,
       case (scan(Job_Title,-1," "))
          when "Manager" then "Manager"
          when "Director" then "Director"
          when "Officer" then "Executive"
          when "President" then "Executive"
          else "N/A"
       end as Level,
	   Salary,
       case (calculated Level)
          when "Manager" then 
             case 
                when  (Salary>72000) then "High"
                when  (Salary>52000) then "Medium"
                else "Low"
             end
          when "Director" then
             case 
                when  (Salary>135000) then "High"
                when  (Salary>108000) then "Medium"
                else "Low"
             end
          when "Executive" then
	          case 
                when  (Salary>300000) then "High"
                when  (Salary>240000) then "Medium"
                else "Low"
             end
          else "N/A"
	  end as Salary_Range
   from orion.staff
   where calculated level ne "N/A" 
   order by Level, Salary desc;
quit;
