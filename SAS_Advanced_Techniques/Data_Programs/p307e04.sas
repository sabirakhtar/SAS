proc datasets lib=orion nolist;
   modify organizationdim;
      index create EmployeeID;
quit;



/*add DATA step and proc print code here*/







proc datasets lib=orion nolist;
   modify organizationdim;
      index delete EmployeeID;
quit;

title;