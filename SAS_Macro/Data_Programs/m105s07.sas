/* m105s07 */

title; 
footnote; 

/* Part B */
%macro sumreport;
   %do num=1 %to 3;
      proc means data=orion.order_fact sum mean maxdec=2;
         where Order_Type = &num;
         var Total_Retail_Price CostPrice_Per_Unit;
         title "Order Type: &num";
      run;
   %end;
%mend sumreport;

%sumreport

/* Part D */
%macro sumreport;
   data _null_;
      set orion.lookup_order_type end=last;
      call symputx('type'||left(_n_), label);
      if last then call symputx('endloop', _n_);
   run;
   %do num=1 %to &endloop;
      proc means data=orion.order_fact sum mean maxdec=2;
         where Order_Type = &num;
         var Total_Retail_Price CostPrice_Per_Unit;
         title "Order Type: &&type&num";
      run;
   %end;
%mend sumreport;

%sumreport
