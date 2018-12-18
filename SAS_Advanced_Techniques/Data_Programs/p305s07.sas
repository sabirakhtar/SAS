data customercoupons;
   drop OT i j Quantity1-Quantity6;
	array pct{3,6} _temporary_;
	if _n_=1 then do i=1 to 3;
	   set orion.coupons;
	   array quan{6} Quantity1-Quantity6;
	   do j=1 to 6;
	      pct{i,j}=quan{j};
		 end;
	end;
	set orion.orderfact(keep=CustomerID OrderType Quantity);
	CouponValue=pct{OrderType,Quantity};
run;

proc print data=customercoupons(obs=5) noobs;
   title 'customercoupons Data Set';
run;

title;
