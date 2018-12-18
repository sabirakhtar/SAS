/* m105s11 */

title; 
footnote; 

/* Part B */
%macro varscope;
   data _null_;
      set orion.customer_type end=final;
      call symputx('localtype'||left(_n_), Customer_Type,'L');
      if final then call symputx('localn',_n_,'L');
   run;
   %put _user_;
%mend varscope;

%varscope

/* Part C */
%macro varscope;
  %local x;
   data _null_;
      set orion.customer_type end=final;
      call symputx('localtype'||left(_n_), Customer_Type);
      if final then call symputx('localn',_n_);
   run;
   %put _user_;
%mend varscope;

%varscope

/* Part D */
%macro varscope;
  %local x;
   data _null_;
      set orion.customer_type end=final;
      call symputx('localtype'||left(_n_), Customer_Type,'G');
      if final then call symputx('localn',_n_,'G');
   run;
   %put _user_;
%mend varscope;

%varscope
