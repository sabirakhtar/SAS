data work.baddata work.gooddata;
   length Employee_ID 8 First $ 12 Last $ 18 
          Gender $ 1 Salary 8 Job_Title $ 25 Country $ 2
          Birth_Date Hire_Date 8;
   infile "&path\nonsales.csv" dlm=',';
   input Employee_ID First $ Last $ 
         Gender $ Salary Job_Title $ Country $ 
         Birth_Date :date9. 
         Hire_Date :date9.;
   format Birth_Date Hire_Date ddmmyy10.;
   if _error_=1 then output work.baddata;
   else output work.gooddata;
run;

proc print data=work.baddata;
run;

proc print data=work.gooddata;
run;
