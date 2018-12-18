*m103d06c;

%macro count(opts,start=01jan08,stop=31dec08);
   proc freq data=orion.orders;
      where order_date between "&start"d and "&stop"d;
      table order_type / &opts;
      title1 "Orders from &start to &stop";
   run;
%mend count;

options mprint;

%count(nocum)
%count(stop=30jun08,start=01apr08)
%count(nocum nopercent,stop=30jun08)
%count()
