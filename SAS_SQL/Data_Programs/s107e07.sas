*** s107e07 ***;
  /*****************************************************
   a. Update data values in existing table rows.
   b. Add rows to an existing table.
      The values you will need for columns 
      Product_ID,Product_Line,Product_Category,Product_Group, 
      Product_Name,Supplier_Country,Supplier_Name,and Supplier_ID are:
      
      240600100202,"Sports","Swim Sports","Snorkel Gear",
         "Coral Dive Mask - Med","AU","Dingo Divers",21001
      240600100203,"Sports","Swim Sports","Snorkel Gear",
         "Coral Dive Mask - Large","AU","Dingo Divers",21001
      240600100212,"Sports","Swim Sports","Snorkel Gear",
         "Coral Dive Fins - Med","AU","Dingo Divers",21001
      240600100213,"Sports","Swim Sports","Snorkel Gear",
         "Coral Dive Fins - Large","AU","Dingo Divers",21001
      240600100222,"Sports","Swim Sports","Snorkel Gear",
         "Coral Advanced Snorkel","AU","Dingo Divers",21001
      240600100223,"Sports","Swim Sports","Snorkel Gear",
         "Coral Pro Snorkel","AU","Dingo Divers",21001
   c. Delete an entire table.
  *****************************************************/
proc sql;
create table work.products as
   select distinct * 
      from orion.product_dim
      order by Product_ID;
quit;
