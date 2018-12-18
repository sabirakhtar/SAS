proc print data = orion.customerdim(obs=5) noobs label; 
   var CustomerID CustomerName CustomerBirthDate;
   title 'Customer Age Group Information';
   format CustomerBirthDate XXXXX;
   label CustomerID='Customer ID' CustomerName='Customer Name'
         CustomerBirthDate='Age Group';
run;
