*** s107d03 ***;

proc sql;
create table discounts
   (Product_ID num format=z12.,
    Start_Date date,
    End_Date date,
    Discount num format=percent.);
quit;
