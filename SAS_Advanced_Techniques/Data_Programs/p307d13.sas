proc report data=orion.totalsalaries
            out=report_pct (drop=_break_ where=(ManagerID ne .)) 
            nowd;
   column ManagerID DeptSal PctSal;
   define ManagerID / display 'Manager ID';
   define DeptSal / sum 'Department Salaries';
   define PctSal / computed format=percent10.2 
                   'Percent of Total Salaries';
   rbreak before / ;
   compute pctsal;
   if _break_ = '_RBREAK_' then grandtot=deptsal.sum; 
      pctsal=deptsal.sum/grandtot;
   endcomp;
run;


proc tabulate data=orion.totalsalaries 
              out=tab_pct(drop=_type_ _page_ _table_);
   class ManagerID;
   var DeptSal;
   table ManagerID='Manager ID', 
         DeptSal='Department Salaries' * (sum*f=dollar14.2 pctsum);
run;
