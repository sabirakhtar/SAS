*** s108e06 ***;

  /* Warning: Case sensitive! */
%let JoinVar=Some_Column_Name;
%let Library=%upcase(ORION);

  /* a. Query 1 */
  /* Write a PROC SQL Query that contains the number of tables
     in the Library which contain the JoinVar column, and
     writes that value to a macro variable called Rows. */


  /* b. Query 2 */
  /* Write a PROC SQL Query that creates a series of macro
     variables called Table1, Table2, ... TableN, etc. 
     (1 for each table in the Library containing the Joinvar
     column) and writes the column name sequentially to
     the Table1-TableN macro variables. N should be the
     number in the Rows macro variable */


  /* c. Query 3 */
  /* Write a PROC SQL Query that creates a macro variable
     called SourceTables, containing a list of the fully-
     qualified names of all the tables in the Library 
     which contain the column JoinVar, separated by commas. 
     The results will look like this: 
     LIBRARY.Table1, LIBRARY.Table2, ...LIBRARY.TableN
     where N is the number in the Rows macro variable. */


  /*****************************************************
      For the exercise, do not edit below this line!
  *****************************************************/

  /*****************************************************
  This macro program joins all the tables in Library 
  which contain the column JoinVar by JoinVar, producing
  a table called Joined_By_JoinVar. By default, the table 
  is created in the work library. For example, if 
     JoinVar = Employee_ID
  then he table produced is 
     work.Joined_by_employee_id
  *****************************************************/

options mprint;
%macro JoinTheTables(OutLib);
%if &OutLib= %then %let OutLib=work;
%if &Rows gt 1 %then %do;
%do i=1 %to &rows;
proc sql noprint;
   select catx('.',"&&Table&i",Name)
          into :&&Table&i.._Columns separated by "," 
      from dictionary.Columns
      where libname="&Library" 
            and MEMNAME="&&Table&i"
            and Name ne "&JoinVar"
;
quit;
%end;
%put _user_;
proc sql;;
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

%put NOTE:  ************* JoinTheTables Macro *********************;
%put NOTE:  Column &JoinVar found was found in &Rows tables;
%put NOTE:  ************* JoinTheTables Macro *********************;
%end;
%else %if &Rows=1 %then %do;
%put NOTE:  ************* JoinTheTables Macro *********************;
%put NOTE:  Column &JoinVar found only in &Library..&Table1 table;
%put NOTE:  No join could be performed;
%put NOTE:  ************* JoinTheTables Macro *********************;
%end;
%else %do;
%put ERROR:  ************* JoinTheTables Macro *********************;
%put ERROR:  Column &JoinVar not found in any of the &Library tables;
%put ERROR:  ************* JoinTheTables Macro *********************;
%end;
%mend;

%JoinTheTables;
