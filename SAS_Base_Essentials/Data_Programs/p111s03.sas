proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

title 'Order Summary by Year and Type';
proc freq data=orion.orders ;
   tables Order_Date;
   tables Order_Type / nocum;
   tables Order_Date*Order_Type / nopercent norow nocol;
   format Order_Date year4. Order_Type ordertypes.;
run;
title;
