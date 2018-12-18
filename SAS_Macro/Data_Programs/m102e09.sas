*m102e09;

title; 
footnote; 

proc print data=orion.organization_dim;
   id Employee_ID;
   var Employee_Name Employee_Country Employee_Gender;
   title 'Listing of All Employees From Orion.Organization_Dim';
run;

title; 