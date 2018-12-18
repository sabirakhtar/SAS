data work.gifts;
	set orion.nonsales;
	length Gift1 $ 6 Gift2 $ 10;
	select(Gender);
    	when('F') do;
       	Gift1='Scarf';
	   	Gift2='Pedometer';
		end;
     	when('M') do;
	   	Gift1='Gloves';
	   	Gift2='Money Clip';
     	end;
	 	otherwise do;
	   	Gift1='Coffee';
	   	Gift2='Calendar';
     	end;
	end;
	keep Employee_ID First Last Gender Gift1 Gift2;
run;  

proc print data=work.gifts noobs;
run;


