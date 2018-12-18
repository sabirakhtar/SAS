*** s107s02 ***; 
 
proc sql;
create table orion.rewards
   (Purchased num format=comma9.2,
    Year num format=4., Level char(9), 
    Award char(50));
quit;
proc sql;
insert into orion.rewards (Year,Level,Purchased,Award)
   values (2012,'Silver',200,'25% Discount on one item over $25')
   values (2012,'Gold',300,'15% Discount on one order over $50')
   values (2012,'Platinum',500,'10% Discount on all 2012 purchases')
   values (2013,'Silver',225,'25% Discount on one item over $50')
   values (2013,'Gold',350,'15% Discount on one order over $100')
   values (2013,'Platinum',600,'10% Discount on all 2013 purchases');
quit;
proc sql;
select * 
   from orion.rewards;
quit;

  /*****************************************************
   Alternate method - add the data using set clauses
proc sql;
insert into orion.rewards
   set year=2012,Level='Silver',Purchased=200,
       Award='25% Discount on one item over $25'
   set year=2012,Level='Gold',Purchased=300,
       Award='15% Discount on one order over $50'
   set year=2012,Level='Platinum',Purchased=500,
       Award='10% Discount on all 2012 purchases'
   set year=2013,Level='Silver',Purchased=225,
       Award='25% Discount on one item over $50'
   set year=2013,Level='Gold',Purchased=350,
       Award='15% Discount on one order over $100'
   set year=2013,Level='Platinum',Purchased=600,
       Award='10% Discount on all 2013 purchases';
quit;
   *****************************************************/
