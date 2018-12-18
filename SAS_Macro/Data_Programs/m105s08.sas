*m105s08;

%macro tops(obs=3);
   proc means data=orion.order_fact sum nway noprint; 
      var Total_Retail_Price;
      class Customer_ID;
      output out=customer_freq sum=sum;
   run;

   proc sort data=customer_freq;
      by descending sum;
   run;

   data _null_;
      set customer_freq(obs=&obs);
      call symputx('top'||left(_n_), Customer_ID);
   run;

   proc print data=orion.customer_dim noobs;
      where Customer_ID in (%do num=1 %to &obs; &&top&num %end;);
      var Customer_ID Customer_Name Customer_Type;
      title "Top &obs Customers";
   run;
%mend tops;

%tops()
%tops(obs=5)
