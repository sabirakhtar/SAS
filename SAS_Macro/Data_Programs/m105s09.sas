*m105s09;

%macro memberlist(custtype);
   proc print data=Orion.Customer_dim;
      var Customer_Name Customer_ID Customer_Age_Group;
      where Customer_Type="&custtype";
      title "A List of &custtype";
   run;
%mend memberlist;

%macro listall;
   data _null_;
      set orion.customer_type end=final;
      call symputx('type'||left(_n_), Customer_Type);
      if final then call symputx('n',_n_);
   run;
   %do num=1 %to &n;
      %memberlist(&&type&num)
   %end;
%mend listall;

%listall
