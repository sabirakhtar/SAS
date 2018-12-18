proc format library=orion;
   invalue $eval 
      'Excellent'=4
           'Good'=3
           'Fair'=2
           'Poor'=1;
   invalue quant 
      1-high=_same_
      other=_error_;
   invalue $Gender (upcase)
      'M'='Male'
      'F'='Female';
run;

options fmtsearch=(orion);

data newcustomers;
 infile "&path\newcustomers.dat" firstobs=2;
 input @1 CustomerID 
       @11 CustomerGender $Gender.  
       @17 CustomerName $20. 
       @37 Quantity quant2.
       @44 TotalRetailPrice 
       @53 Rating $eval.;
run;
 
proc print data=newcustomers(obs=5) noobs;
  title 'User Defined Informats';
run;

title;
