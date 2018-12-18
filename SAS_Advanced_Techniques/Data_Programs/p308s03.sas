proc fcmp outlib=orion.functions.DateType;
   function CustAge(Date) $ 15;
      age=int((today()-date)/365.25);
	   if age < 30 then return('Under 30');
	   else if age < 45 then return('30 to 44 years');
	   else if age < 60 then return('45 to 60 years');
	   else return('Over 60');
   endsub;
quit;

options cmplib=orion.functions;

proc format;
   value custgroup other=[custage()];
run;

proc print data = orion.customerdim(obs=5) noobs label; 
   var CustomerID CustomerName CustomerBirthDate;
   title 'Customer Age Group Information';
   format CustomerBirthDate custgroup.;
   label CustomerID='Customer ID' CustomerName='Customer Name'
         CustomerBirthDate='Age Group';
run;

title;
