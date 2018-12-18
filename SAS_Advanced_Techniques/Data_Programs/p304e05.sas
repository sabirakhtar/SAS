proc sql;
   insert into pricelist(ProductID, 
                         StartDate,
                         EndDate, 
                         UnitCostPrice,
                         UnitSalesPrice,
                         Factor,
                         UnitProfit)
      values (210200100009, '15FEB2011'd, '31DEC9999'd, 15.50, 34.70, 1.00, 19.20);
quit;
     


