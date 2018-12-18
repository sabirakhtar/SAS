proc freq data=orion.sales;
   tables Gender;
   where Country='AU';
run;



