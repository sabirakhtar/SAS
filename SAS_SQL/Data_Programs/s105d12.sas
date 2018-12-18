*** s105d12 ***;

   /* Traditional SAS Program Code */
   /* for Complex Join             */

  /**********************************************************
   Step 1:  Identify the employees who sold Expedition Zero
            merchandise in 2011.
   *********************************************************/
proc sort data=orion.order_fact
            (keep=Product_ID Employee_ID Order_Date
            where=(YEAR(Order_Date)=2011 and Employee_ID ne 99999999))
            out=orders_2011 (Drop=Order_Date);
   by Product_ID;
run;
proc sort data=orion.product_dim (keep=Product_ID Product_Name)
          out=products;
   by Product_ID;
run;
data employees (Keep=Employee_ID);
   merge orders_2011 (In=KeepMe)
         products (where=(Product_Name contains 'Expedition Zero'));
   by Product_ID;
   if KeepMe and Product_Name ne '';
run;

proc sort data=employees nodup;
   by Employee_ID;
run;

  /**********************************************************
   Step 2:  Find the employee identifier for the managers of
            these employees
   *********************************************************/
data manager_id (rename=(Manager_ID=Employee_ID));
   merge employees (in=KeepMe)
         orion.employee_organization (keep=Employee_ID Manager_ID);
   by Employee_ID;
   if KeepMe;
   drop Employee_ID;
run;
proc sort data=manager_id nodup;
   by Employee_ID;
run;

  /**********************************************************
   Step 3:  Obtain the managers' names and city information
   *********************************************************/
proc sort data=orion.employee_addresses (Keep=Employee_ID Employee_Name City)
          out=employees;
   by Employee_ID;
run;

data managers;
   length Manager $28.;
   merge manager_id (in=KeepMe)
         employees;
   by Employee_ID;
   if KeepMe;
   Manager=Employee_Name;
   drop Employee_ID Employee_Name;
run;
proc print data=managers noobs;
run;
