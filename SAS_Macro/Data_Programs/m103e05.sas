*m103e05;

options nolabel;
title 'Order Stats';
proc means data=orion.order_fact maxdec=2 mean;
   var total_retail_price;
   class order_type;
run;
title;
