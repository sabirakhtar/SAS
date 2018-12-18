*m105d08;

%macro readraw(first=2007,last=2011);
   %do year=&first %to &last;
      data year&year;
         infile "&path\orders&year..dat";
         input order_ID order_type order_date : date9.;
      run;
  %end;
%mend readraw;

options mlogic mprint;

%readraw(first=2008,last=2010)
