*** s107s03 ***;

proc sql;
create table work.direct_compensation as
   select hr.Employee_ID, 
          catx(' ',First_Name,Last_Name) as Name,
          scan(Job_Title,-1) format=$3. as Level,
          Salary format=comma12.2, 
          Sales*0.15  format=comma7.2 as Commission, 
          Salary+calculated Commission format=comma12.2
             as Direct_Compensation 
      from orion.sales as hr,
           (select Employee_ID, 
                   sum(Total_Retail_Price) as Sales
               from orion.order_fact
               where year(Order_Date)=2011
               group by Employee_ID) as sales
      where hr.Employee_ID=sales.Employee_ID
            and Job_Title like ('%Rep%');
select *
   from work.direct_compensation 
   order by Level, Direct_Compensation desc;
quit;


