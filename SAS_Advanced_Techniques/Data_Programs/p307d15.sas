proc sql nonumber;
   create table euros as
      select CustomerID, OrderDate, ProductID, 
             TotalRetailPrice, SDate, EDate, 
             AvgRate format=8.6,
             TotalRetailPrice*AvgRate as EuroPrice 
             format=Euro10.2
      from orion.orderfact, orion.rates
      where OrderDate between SDate and EDate;

title 'euros SQL Data Set';
   select * from euros(obs=5);
quit; 



title;

