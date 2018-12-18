data movingq;
   drop i;
   do I=11, 10, 9;
     NextFile=cats("&path\mon" , i, ".dat");  *  Windows and Unix;
     infile ORD filevar=NextFile dlm=',';      
     input Customer_ID 
           Order_ID 
           Order_Type 
           Order_Date : date9.
           Delivery_Date : date9.;
     output;
    end;
  stop;
run;


proc print data=movingq;
   title 'Moving Quarter Data';
   format Order_Date Delivery_Date date9.;
run;

title;
