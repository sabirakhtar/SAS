proc sql;
   create table ManagerNames as
      select e.EmployeeID, 
             ManagerLevel1, 
             ManagerLevel2, 
             ManagerLevel3, 
             ManagerLevel4, 
             ManagerLevel5, 
             ManagerLevel6, 
             m1.EmployeeName as Manager1Name, 
             m2.EmployeeName as Manager2Name, 
             m3.EmployeeName as Manager3Name,
             m4.EmployeeName as Manager4Name,
             m5.EmployeeName as Manager5Name,
             m6.EmployeeName as Manager6Name
         from orion.organizationdim as e 
         left join orion.employeeaddresses as m1 
            on e.ManagerLevel1=m1.EmployeeID 
         left join orion.employeeaddresses as m2 
            on e.ManagerLevel2=m2.EmployeeID
         left join orion.employeeaddresses as m3 
            on e.ManagerLevel3=m3.EmployeeID
         left join orion.employeeaddresses as m4 
            on e.ManagerLevel4=m4.EmployeeID
         left join orion.employeeaddresses as m5 
            on e.ManagerLevel5=m5.EmployeeID
         left join orion.employeeaddresses as m6 
            on e.ManagerLevel6=m6.EmployeeID
               order by e.EmployeeID;
quit;

 /* DATA step Solution */

proc sort data=orion.employeeaddresses  
	out=empaddresses(rename=(EmployeeID=ManagerLevel1 
                           EmployeeName=Manager1Name));
   by EmployeeID;
run;

proc sort data=orion.organizationdim 
          out=man1(keep=EmployeeID ManagerLevel1-ManagerLevel6);
   by ManagerLevel1;
run;

data manager1;
   merge man1(in=M) 
         empaddresses(keep=ManagerLevel1 Manager1Name);
   by ManagerLevel1;
   if M;
run;

proc sort data=manager1 out=man2;
   by ManagerLevel2;
run;

data manager2;
   merge man2(in=M) 
         empaddresses(rename=(ManagerLevel1=ManagerLevel2
                              Manager1Name=Manger2Name)
                      keep=ManagerLevel1 Manager1Name);
   by ManagerLevel2;
   if M;
run;

proc sort data=manager2 out=man3;
   by ManagerLevel3;
run;

data manager3;
   merge man3(in=M) 
         empaddresses(rename=(ManagerLevel1=ManagerLevel3
                              Manager1Name=Manger3Name)
                      keep=ManagerLevel1 Manager1Name);
   by ManagerLevel3;
   if M;
run;

proc sort data=manager3 out=man4;
   by ManagerLevel4;
run;

data manager4;
   merge man4(in=M) 
         empaddresses(rename=(ManagerLevel1=ManagerLevel4
                              Manager1Name=Manger4Name)
                      keep=ManagerLevel1 Manager1Name);
   by ManagerLevel4;
   if M;
run;

proc sort data=manager4 out=man5;
   by ManagerLevel5;
run;

data manager5;
   merge man5(in=M) 
         empaddresses(rename=(ManagerLevel1=ManagerLevel5
                              Manager1Name=Manger5Name)
                      keep=ManagerLevel1 Manager1Name);
   by ManagerLevel5;
   if M;
run;

proc sort data=manager5 out=man6;
   by ManagerLevel6;
run;

data managernames;
   merge man6(in=M) 
         empaddresses(rename=(ManagerLevel1=ManagerLevel6
                              Manager1Name=Manger6Name)
                      keep=ManagerLevel1 Manager1Name);
   by ManagerLevel6;
   if M;
run;

proc sort data=managernames;
   by EmployeeID;
run;


proc print data=managernames(firstobs=420  obs=424);
   title 'Partial ManagerNames Data';
   title2 'FirstObs=420';
run;

title;
