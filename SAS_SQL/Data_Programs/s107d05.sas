*** s107d05 ***;
 
proc sql;
create table discounts
   (Product_ID num format=z12.,
    Start_Date date,
    End_Date date,
    Discount num format=percent.);
insert into discounts
   values(230100300006,'01MAR2013'd,'15MAR2013'd,.33)
   values(230100600018,'16MAR2013'd,'31MAR2013'd,.15);
insert into discounts 
   (Start_Date,End_Date, Product_ID, Discount) 
    values ('01MAR2013'd,'15MAR2013'd,230100300006,.33)
    values ('16MAR2013'd,'31MAR2013'd,230100600018,.15);
quit;
