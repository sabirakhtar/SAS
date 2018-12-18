*m105d07;

%macro putloop;
  %do i=1 %to &numrows;
      %put Country&i is &&country&i;
  %end;
%mend putloop;

%putloop