*m103a01;

%macro dog(name=spot);
   %put My dog is &name;
%mend dog;

%dog( )
