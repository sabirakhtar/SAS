data neworders;
  set orion.orders(obs=5);
  month=month(orderdate);
  day=day(orderdate);
  orderdate=mdy(month,day,2008);
  month=month(deliverydate);
  day=day(deliverydate);
  deliverydate=mdy(month,day,2008);
  orderid+14239000;
  drop month day;
run;

proc append base=orders data=neworders;
run;
