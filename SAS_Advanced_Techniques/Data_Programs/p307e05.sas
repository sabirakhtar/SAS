proc datasets lib=orion nolist;
   modify shoeprices;
      index create ProductID;
quit;


 
/*add DATA step and proc print code here*/





proc datasets lib=orion nolist;
   modify shoeprices;
      index delete ProductID;
quit;

title;
