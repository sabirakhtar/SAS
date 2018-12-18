data processedorders;
   length Comment $30;
   set orion.firstinternetorder;
   set orion.internet key=OrderID;
   select (_iorc_);
      when (%sysrc(_sok)) do;
         Comment='Order has been processed.';
         output;
      end;
      when (%sysrc(_dsenom)) do;
         _ERROR_=0;
         Comment='Order has not been processed.';
         output;
      end;
      otherwise;
  end;
run;

proc print data=processedorders(firstobs=6 obs=10) noobs;
   title 'Internet Orders';
   title2 'Observations 6-10';
run;

title;
