proc datasets lib=orion nolist;
   modify organizationdim;
      index create EmployeeID;
quit;

data salesemps;
   set orion.salesstaff;
   set orion.organizationdim(keep=EmployeeID Department Section OrgGroup)
      key=EmployeeID;
   if _IORC_=0;
run;

proc print data=salesemps(obs=5) noobs;
   title 'Sales Employee Data';
   title2 '(First 5 Observations)';
run;

title;

proc datasets lib=orion nolist;
   modify organizationdim;
      index delete EmployeeID;
quit;
