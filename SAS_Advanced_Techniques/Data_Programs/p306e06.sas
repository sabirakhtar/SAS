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
 
   end;

run;

proc print data=expensive noobs;
  title "The Five Most Expensive Shoes";
run;

proc print data=leastexpensive noobs;
  title "The Five Least Expensive Shoes";
run;

title;
