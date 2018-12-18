*** s107e08 ***;

proc sql;
create table work.products as
   select distinct * 
   from orion.product_dim
   order by Product_ID;
create table work.new_products
   (Product_ID num label='Product ID',
    Product_Line char(20) label='Product Line',
    Product_Category char(25) label='Product Category',
    Product_Group char(25) label='Product Group',
    Product_Name char(45) label='Product Name',
    Supplier_Country char(2) label='Supplier Country',
    Supplier_Name char(30) label='Supplier Name',
    Supplier_ID num label='Supplier ID');
insert into work.new_products(Product_ID,Product_Line, 
            Product_Category, Product_Group, Product_Name,
            Supplier_Country, Supplier_Name, Supplier_ID)
   values(240600100202,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Mask - Med","AU","Dingo Divers",21001)
   values(240600100203,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Mask - Large","AU","Dingo Divers",21001)
   values(240600100212,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Fins - Med","AU","Dingo Divers",21001)
   values(240600100213,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Fins - Large","AU","Dingo Divers",21001)
   values(240600100222,"Sports","Swim Sports","Snorkel Gear",
          "Coral Advanced Snorkel","AU","Dingo Divers",21001)
   values(240600100223,"Sports","Swim Sports","Snorkel Gear",
          "Coral Pro Snorkel","AU","Dingo Divers",21001)
   values(240600100341,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Small","AU","Dingo Divers",21001)
   values(240600100342,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Med","AU","Dingo Divers",21001)
   values(240600100343,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Large","AU","Dingo Divers",21001)
   values(240600100351,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Goody Bag - Large","AU","Dingo Divers",21001)
   values(240600100352,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Knife","AU","Dingo Divers",21001)
   values(240600100361,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Small","AU","Dingo Divers",21001)
   values(240600100362,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Med","AU","Dingo Divers",21001)
   values(240600100363,"Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Large","AU","Dingo Divers",21001);
quit;

