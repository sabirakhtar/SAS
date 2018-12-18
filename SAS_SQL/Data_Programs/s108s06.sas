*** s108s06 ***;

  /* Warning: Case sensitive! */
%let JoinVar=Some_Column_Name;
%let Library=%upcase(ORION);

  /* a. Query 1 */
proc sql noprint;
select strip(put(count(*),5.))
       into :Rows
   from dictionary.columns
   where libname="&Library" 
         and name="&JoinVar";
quit;

  /* b. Query 2 */
proc sql noprint;
select memname
       into :Table1-:Table&Rows
   from dictionary.columns
   where libname="&Library" 
      and name="&JoinVar";
quit;

  /* c. Query 3 */
proc sql noprint;
select catx('.',libname,memname)
       into :SourceTables separated by ','
   from dictionary.columns
   where libname="&Library" 
         and NAME="&JoinVar";
quit;

  /*****************************************************
      For the exercise, do not edit below this line!
  *****************************************************/

  /*****************************************************
  This macro program joins all the tables in Library 
  which contain the column JoinVar by JoinVar, producing
  a table called Joined_By_JoinVar. By default, the table 
  is created in the work library. For example, if 
     JoinVar = Employee_ID
  then the table produced is 
     work.Joined_by_employee_id
  *****************************************************/

options mprint;
%Macro JoinTheTables(OutLib);
%if &OutLib= %then %let OutLib=work;
%if &Rows gt 1 %then %do;
   %do i=1 %to &rows;
       proc sql noprint;
          select catx('.',"&&Table&i",Name)
             into :&&Table&i.._Columns separated by "," 
             from dictionary.Columns
             where libname="&Library" 
                   and memname="&&Table&i"
                    and Name ne "&JoinVar"
        ;
        quit;
        %end;
    %put _user_;
   proc sql;
   create table &OutLib..Joined_by_&JoinVar AS
      select &&Table1..&JoinVar
   %do i=1 %to &Rows;
       %let ThisColumn=&&&Table&i.._Columns;
       , &&&ThisColumn
   %end;
       from &SourceTables
       where &Table1..&JoinVar=&Table2..&JoinVar
   %do i=2 %to %eval(&Rows-1);
       %let j=%eval(&i+1);
       and &&Table&i...&JoinVar=&&Table&j...&JoinVar 
   %end;
   ;
   quit; 
     %put NOTE:  ************* JoinTheTables Macro *************;
     %put NOTE:  Column &JoinVar found was found in &Rows tables;
     %put NOTE:  ************* JoinTheTables Macro *************;
   %end;
   %else %if &Rows=1 %then %do;
     %put NOTE:  ************* JoinTheTables Macro *************;
     %put NOTE:  Column &JoinVar found only in                  ;
     %put NOTE:  &Library..&Table1 table                        ;
     %put NOTE:  No join could be performed                     ;
     %put NOTE:  ************* JoinTheTables Macro *************;
   %end;
    %else %do;
      %put ERROR:  ************* JoinTheTables Macro *************;
      %put ERROR:  Column &JoinVar not found in any               ; 
      %put ERROR:  of the &Library tables                         ;
      %put ERROR:  ************* JoinTheTables Macro *************;
    %end;
%mend;

%JoinTheTables;
