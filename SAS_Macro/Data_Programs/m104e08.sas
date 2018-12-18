*m104e08;

proc sql;
  select customer_id, sum(Total_Retail_Price) as total
    from orion.order_fact
    group by Customer_ID
    order by total descending;
quit;

proc print data=orion.customer_dim noobs;
   where Customer_ID in (&top3);
   var Customer_ID Customer_Name Customer_Type;
   title 'Top 3 Customers';
run;
