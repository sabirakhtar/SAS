*m105e08;

title; 
footnote; 

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
%mend tops;

%tops()
%tops(obs=5)
