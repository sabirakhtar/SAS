data combine (drop=ProdID);
   array msp{21:24,2} _temporary_ (     ., 70.79,
                                   173.79,174.40,
                                         .,     .,
                                    29.65,287.80);
   set orion.shoesales;
   ProdID=put(ProductID, 12.);
   ProductLine=input(substr(ProdID,1,2),2.);
   ProductCategory=input(substr(ProdID,3,2),2.);
   ManufacturerSuggestedPrice=msp{ProductLine, ProductCategory};
run;

proc print data=combine(obs=5);
   title1 "The Coupon Value";
run;

title;
