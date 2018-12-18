*m103e06;

title; 
footnote; 

%macro specialchars(name);
   proc print data=orion.employee_addresses;
      where Employee_Name="&name";
      var Employee_ID Street_Number Street_Name City State Postal_Code;
      title "Data for &name";
   run;
%mend specialchars;
