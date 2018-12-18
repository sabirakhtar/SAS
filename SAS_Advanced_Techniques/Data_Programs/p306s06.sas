data expensive leastexpensive;
   drop i;
   if _N_=1 then do;
      if 0 then set orion.shoesales;
      declare hash Shoes(dataset:'orion.shoesales',
                         ordered:'descending');
      shoes.definekey('TotalRetailPrice');
      shoes.definedata('TotalRetailPrice',
                       'ProductID', 'ProductName');
      shoes.definedone();
      declare hiter S('Shoes');
   end;
   S.first();
   do i=1 to 5;
      output expensive;
      S.next();
   end;
   S.last();
   do i=1 to 5;
     output leastexpensive;
     S.prev();
   end; 
   stop;
run;

proc print data=expensive noobs;
  title "The Five Most Expensive Shoes";
run;

proc print data=leastexpensive noobs;
  title "The Five Least Expensive Shoes";
run;

title;
