*m104d02;

%let start=01Jan2011;
%let stop=31Dec2011;

proc means data=orion.order_fact noprint;
   where order_date between "&start"d and "&stop"d;
   var total_retail_price;
   output out=stats n=count mean=avg;
run;

data _null_;
   set stats;
   call symputx('orders',count);
   call symputx('average',avg);
run;

proc sgplot data=orion.order_fact;
   where order_date between "&start"d and "&stop"d;
   vbar order_type / response=total_retail_price stat=mean
        group=order_type dataskin=gloss;
   refline &average / axis=y ;  
   inset ("Orders this period:"="&orders" 
      "Overall Average:"="%sysfunc(putn(&average,dollar4.))")
      /border textattrs=(Color=blue Weight=Bold);
   xaxis type=discrete;
   yaxis values=(0 to 320 by 40);
   format total_retail_price dollar4. order_type 3.;
   label total_retail_price='Average Order';
   title "Report from &start to &stop";
run;

title;
