*** s107a01 ***;

proc sql;
create table discounts
   (Product_ID num format=z12.,
    Start_Date date,
    End_Date date,
    Discount num format=percent.);
describe table discounts;
quit;
