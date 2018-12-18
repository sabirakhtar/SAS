data movingq;
   drop MonNum MidMon LastMon i;
   MonNum=month(today());
   MidMon=month(intnx('month', today(), -1));
   LastMon=month(intnx('month', today(), -2));
   do i=MonNum, Midmon, LastMon;
      NextFile=cats("&path\mon", i, ".dat"); 
      infile ORD filevar=NextFile dlm=',' 
             end=LastObs;
      do while (not LastObs);
         input Customer_ID 
               Order_ID 
               Order_Type 
               Order_Date : date9. 
               Delivery_Date : date9.;
         output;
      end;
   end;
   stop;
run;


proc print data=movingq;
   title 'Moving Quarter Data';
   format Order_Date Delivery_Date date9.;
run;

title;
