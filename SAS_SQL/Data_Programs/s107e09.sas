*** s109e06 ***;
proc sql;
create table work.products as
   select distinct * 
      from orion.product_dim
      order by Product_ID;
create table work.new_products
   (Product_ID CHAR(12) label='Product ID',  
    Product_Line char(20) label='Product Line',
    Product_Category char(25) label='Product Category',
    Product_Group char(25) label='Product Group',
    Product_Name char(45) label='Product Name');
insert into work.new_products
(Product_ID,Product_Line,Product_Category,Product_Group,Product_Name)

   values("240600100202","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Mask - Med")
   values("240600100203","Sports","Swim Sports","Snorkel Gear",             
          "Coral Dive Mask - Large")
   values("240600100212","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Fins - Med")
   values("240600100213","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Fins - Large")
   values("240600100222","Sports","Swim Sports","Snorkel Gear",
          "Coral Advanced Snorkel")
   values("240600100223","Sports","Swim Sports","Snorkel Gear",
          "Coral Pro Snorkel")
   values("240600100341","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Small")
   values("240600100342","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Med")
   values("240600100343","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Skin - Large")
   values("240600100351","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Goody Bag - Large")
   values("240600100352","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Knife")
   values("240600100361","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Small")
   values("240600100362","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Med")
   values("240600100363","Sports","Swim Sports","Snorkel Gear",
          "Coral Dive Duffel - Large");
create table work.supplier
   (Country char(2) label='Supplier Country',
    Name char(30) label='Supplier Name',
    ID num label='Supplier ID');
insert into work.supplier(ID, Name,Country)
   values(21001,"Dingo Divers","AU");
quit;
