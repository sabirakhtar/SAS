*m103s05;

%macro orderstats (var=total_retail_price, class=order_type, stats=mean, decimals=2);
	options nolabel;
	title 'Order Stats';
	proc means data=orion.order_fact maxdec=&decimals &stats;
		var &var;
		class &class;
	run;
	title;
%mend orderstats;

option mprint;

%orderstats()
%orderstats(var=costprice_per_unit, class=quantity, stats=min mean max, decimals=0)
%orderstats(stats=min mean max, decimals=0)
