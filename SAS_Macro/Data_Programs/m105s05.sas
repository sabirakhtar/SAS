*m105s05;

%macro listing(custtype) / minoperator;
	%if &custtype=  %then %do;
		proc print data= orion.customer noobs;
      	var Customer_ID Customer_Name Customer_Type_ID;
      	title "All Customers"; 
			run;
	%end;
   %else %do;
		proc sql noprint;
		select distinct Customer_Type_ID into :IDlist separated by ' '
      	from orion.customer_type;
      quit;
		%if &custtype in &idlist %then %do;
			proc print data= orion.customer noobs;
	   		where Customer_Type_ID =&custtype;
	   		var Customer_ID Customer_Name;
      		title "Customer Type: &custtype";
			run;
   	%end;
   	%else %do;
         %put ERROR: Invalid CUSTTYPE.;                                                                                       
         %put ERROR- Valid CUSTTYPEs: &IDlist..;
      %end;
	%end;
%mend listing;

%listing()
%listing(1020)
%listing(9999)
