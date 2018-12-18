*m105e12;

title; 
footnote; 

%macro createmacvar;
   data _null_;
      set orion.lookup_order_type end=last;
      call symputx('type'||left(start), label,'L');
      if last then call symputx('endloop', _n_,'L');
   run;
%mend createmacvar;

%macro sumreport;
   %createmacvar
   %do num=1 %to &endloop;
      proc means data=orion.order_fact sum mean maxdec=2;
         where Order_Type = &num;
         var Total_Retail_Price CostPrice_Per_Unit;
         title "Summary Report for &&type&num";
      run;
   %end;
%mend sumreport;

%sumreport
