*m105e11;

title; 
footnote; 

%macro varscope;
   data _null_;
      set orion.customer_type end=final;
      call symputx('localtype'||left(_n_), Customer_Type);
      if final then call symputx('localn',_n_);
   run;
   %put _user_;
%mend varscope;

%varscope
