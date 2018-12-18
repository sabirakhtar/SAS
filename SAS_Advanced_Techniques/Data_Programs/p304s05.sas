options msglevel=i;

data pricelist(index=(ProductID/unique));
   set orion.pricelist;
   UnitProfit=UnitSalesPrice-UnitCostPrice;
run;

options msglevel=n;


     


