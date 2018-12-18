data customercoupons;
   drop OT Quant Value i;
   array pct{3,6} _temporary_ ;
   if _N_=1 then do i=1 to all;
      set orion.couponpct nobs=all;
      pct{OT,Quant}=Value;
   end;
   set orion.orderfact(keep=CustomerID OrderType Quantity);
   CouponValue=pct{OrderType,Quantity};
run;

proc print data=customercoupons(obs=5) noobs;
   title 'The Coupon Percentage Value';
run;

title;
