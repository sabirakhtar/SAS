data movingq;
   drop MonNum MidMon LastMon i;
   MonNum=month(today()); 
   MidMon=MonNum - 1; 
   LastMon=MidMon - 1;
   do i=MonNum, Midmon, LastMon;
      NextFile=cats("&path\mon", i, ".dat"); * Windows and UNIX;
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
