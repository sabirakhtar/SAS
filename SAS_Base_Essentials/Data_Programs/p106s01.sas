 /* part b */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F';
run;

 /* part d */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 36;
run;

 /* part e */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 36  and
         Customer_Group contains 'Gold';
run;

 /* part f */
data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 36 and
         Customer_Group contains 'Gold';
	Discount=.25;
run;

proc print data=work.youngadult;
   var Customer_Name Customer_Age  
        Customer_Gender Customer_Group Discount;
	id Customer_ID;
run;
