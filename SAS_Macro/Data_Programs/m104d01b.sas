*m104d01b;

%let month=2;
%let year=2011;

data orders;
   keep order_date order_type quantity total_retail_price;
   set orion.order_fact end=final;
   where year(order_date)=&year and month(order_date)=&month;
   if order_type=3 then Number+1;
   if final then do;
      put Number=;
      if Number=0 then do;
         call symputx('foot', 'No Internet Orders');
      end;
      else do;
         call symputx('foot', 'Some Internet Orders');
      end;
   end;
run;

options nocenter ps=20;

proc print data=orders;
   title "Orders for &month-&year";
   footnote "&foot";
run;

title;
footnote;
