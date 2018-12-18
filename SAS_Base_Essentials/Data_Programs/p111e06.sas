proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

title 'Revenue from All Orders';
proc means data=orion.order_fact;
run;
title;
