/* m103s06 */ 

/* Part A */
%macro specialchars(name);
   proc print data=orion.employee_addresses;
      where Employee_Name="&name";
      var Employee_ID Street_Number Street_Name City State Postal_Code;
      title "Data for &name";
   run;
%mend specialchars;

/* Part B */
%specialchars(%str(Abbott, Ray))
