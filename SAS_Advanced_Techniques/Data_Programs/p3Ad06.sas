data movingq;
   drop Today MonNum MidMon LastMon i;    
   Today=today();
   MonNum=month(Today);
   MidMon=month(intnx('month', Today, -1));
   LastMon=month(intnx('month', Today, -2));
   do i=MonNum, MidMon, LastMon;
      NextFile=cats("&path\mon", i, ".dat"); 
      infile ORD filevar=NextFile dlm=',' end=LastObs;
      do while (not LastObs);
         input Customer_ID Order_ID Order_Type 
               Order_Date : date9. Delivery_Date : date9.;
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
