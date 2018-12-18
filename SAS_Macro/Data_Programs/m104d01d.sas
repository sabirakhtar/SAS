*m104d01d;

%let month=1;
%let year=2011;

data orders;
   keep order_date order_type quantity total_retail_price;
   set orion.order_fact end=final;
   where year(order_date)=&year and month(order_date)=&month;
   if order_type=3 then do;
      Number+1;
      Amount+total_retail_price;
      Date=order_date;
      retain date;
      end;
   if final then do;
      if number=0 then do;
         call symputx('dat', 'N/A');
         call symputx('avg', 'N/A');
      end;
      else do;
         call symputx('dat', put(date,mmddyy10.));
         call symputx('avg', put(amount/number,dollar8.));
      end;
   end;
run;

options nocenter ps=20;

proc print data=orders;
   title "Orders for &month-&year";
   footnote1 "Average Internet Order: &avg";
   footnote2 "Last Internet Order: &dat";
run;

title;
footnote;