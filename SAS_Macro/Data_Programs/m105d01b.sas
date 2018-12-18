*m105d01b;

%macro reports;
   proc print data=orion.order_fact;
      where order_date="&sysdate9"d;
      var product_id total_retail_price;
      title "Daily sales: &sysdate9";
   run;
%if &sysday=Friday %then %do;
   proc means data=orion.order_fact n sum mean;
      where order_date between "&sysdate9"d-6 and "&sysdate9"d;
      var quantity total_retail_price;
      title "Weekly sales: &sysdate9";
   run;
%end;
%mend reports;

%reports
