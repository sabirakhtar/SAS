filename levels ("&path\level1.dat" "&path\level2.dat" "&path\level3.dat");  *  Windows and UNIX;

 
data all_levels;
   length Customer_Name $ 40 Customer_Age_Group $ 12 Customer_Type $ 40
          Customer_Group $ 40;
   infile levels dlm=',';
   input Customer_Name $ Customer_Age_Group $ Customer_Type $ Customer_Group $;
run;

proc print data=all_levels;
run;
   
