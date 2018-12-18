data customercoupons;
   array pct{3,6} _temporary_ (10, 10, 15, 20, 20, 25, 
                               10, 15, 20, 25, 25, 30, 
                               10, 15, 15, 20, 25, 25);
   set orion.orderfact(keep=CustomerID OrderType Quantity);
   CouponValue=pct{OrderType,Quantity};
run;

proc print data=customercoupons(obs=5);
   title 'The Coupon Value';
run;
