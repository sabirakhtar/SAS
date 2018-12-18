data manager;
   length EmployeeName EmpName ManagerName $40;
   keep EmployeeID EmpName ManagerID ManagerName Salary;
   if _N_=1 then do;
      declare hash M(dataset:'orion.staff');
      M.definekey('EmployeeID');
      M.definedata('ManagerID');
      M.definedone();
      declare hash N(dataset:'orion.employeeaddresses');
      N.definekey('EmployeeID');
      N.definedata('EmployeeName');
      N.definedone();
      call missing(EmployeeName); 
   end;
   set orion.employeepayroll(keep=EmployeeID Salary);
   rc1=M.find(key:EmployeeID);
   rc2=N.find(key:EmployeeID);
   if rc2=0 then EmpName=EmployeeName;
   else EmpName=' ';
   rc3=N.find(key:ManagerID);
   if rc3=0 then ManagerName=EmployeeName;
   else ManagerName=' ';
run;

proc print data=manager(obs=5) noobs;
  title "manager Data Set";
run;

title;


