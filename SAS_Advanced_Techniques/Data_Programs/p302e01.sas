data _null_;
   infile "&path\BIGorderfact.dat" pad; *Windows and UNIX;
/* infile '.workshop.rawdata(BIGorderfact)' pad; *z/OS;*/
   input @37 Order_Date date9. @;
   input  @1 Customer_ID 12. 
         @13 Employee_ID 12.
         @25 Street_ID 12.
         @46 Delivery_Date Date9.
         @55 Order_ID 12.
         @67 Order_Type 2.
         @69 Product_ID 12.
         @81 Quantity 4.
         @90 Total_Retail_Price 13.
        @105 CostPrice_Per_Unit 10.
        @115 Discount 5.;
   if year(Order_Date)=2010;
   format Customer_ID Employee_ID Street_ID Order_ID 
          Product_ID 12. Order_Date Delivery_Date date9. 
          Order_Type 2. Quantity 4. Total_Retail_Price dollar13.2
          CostPrice_Per_Unit dollar10.2 Discount Percent.;
run;
