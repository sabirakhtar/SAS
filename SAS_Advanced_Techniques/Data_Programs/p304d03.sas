options msglevel=i;

data orion.saleshistory(index=(CustomerID ProductID
                               SaleID=(OrderID ProductID)/unique));
   set orion.history;
   ValueCost=CostPricePerUnit*Quantity;
   YearMonth=mdy(MonthNum,15,input(YearID,4.));
   format ValueCost dollar12.
          YearMonth monyy7.;
   label ValueCost="Value Cost"
         YearMonth="Month/Year";
run;

options msglevel=n;
