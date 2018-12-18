data shoesales;
   drop i;
   length Rank $ 8;
   if _N_=1 then do;
      if 0 then set orion.shoesales;
      declare hash Shoes(dataset:'orion.shoesales',
                         ordered:'descending');
      Shoes.definekey('TotalRetailPrice');
      Shoes.definedata('TotalRetailPrice',
                       'ProductID', 'ProductName');
      Shoes.definedone();
      declare hiter S('Shoes');
   end;
   S.first();
   do i=1 to 5;
      Rank=catx(' ', 'Top', i);
      output;
      S.next();
   end;
   S.last();
   do i=1 to 5;
      Rank=catx(' ', 'Bottom', i);
      output;
      S.prev();
   end; 
   stop;
run;

proc print data=shoesales noobs;
  title "work.shoesales Data Set";
run;

title;
