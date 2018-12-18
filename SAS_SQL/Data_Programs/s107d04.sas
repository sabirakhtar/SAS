*** s107d04 ***;

proc sql;
create table discounts
   (Product_ID num format=z12.,
    Start_Date date,
    End_Date date,
    Discount num format=PERCENT.);
insert into discounts
   set Product_ID=230100300006,
       Start_Date='01MAR2013'd,
       End_Date='15MAR2013'd,Discount=.33
   set Product_ID=230100600018,
       Start_Date='16MAR2013'd,
       End_Date='31MAR2013'd, Discount=.15;
quit;
  /*****************************************************
   Bonus example: Nested SELECT within a SET statement 
  *****************************************************/
proc sql;
insert into discounts
   set Product_ID=123456789012, 
       Discount=0.2,
       Start_Date=(select max(Order_Date) 
                      from orion.order_fact),
       End_Date=(Start_Date+30);
quit;
   
