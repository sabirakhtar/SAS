data orders;
   set orion.orders;
   DaysToDelivery=DeliveryDate - OrderDate;
run;

