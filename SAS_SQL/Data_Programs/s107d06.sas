*** s107d06 ***;

proc sql;
create table discounts
   (Product_ID num format=z12.,
    Start_Date date,
    End_Date date,
    Discount num format=PERCENT.);
insert into discounts
   (Product_ID,Discount,Start_Date,End_Date)
   select distinct Product_ID,.35,
         '01MAR2013'd,'31MAR2013'd
      from orion.Product_dim
      where Supplier_Name contains 
            'Pro Sportswear Inc';
quit;
