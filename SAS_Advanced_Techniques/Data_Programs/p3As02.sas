data all_levels;
   drop i;
   length Customer_Name $ 40 Customer_Age_Group $ 12 
          Customer_Type $ 40 Customer_Group $ 40;
   do i=1 to 3;
      NextFile=cats("&path\level", i, ".dat");  *  Windows and UNIX;
      infile levels filevar=NextFile dlm=',' 
                       end=Last;
      do while (Last=0);

         input Customer_Name $ Customer_Age_Group $ 
               Customer_Type $  
               Customer_Group $;
         output;
      end;
   end;
   stop;
run;

proc print data=all_levels;
run;

