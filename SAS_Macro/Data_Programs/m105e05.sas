*m105e05;

%macro listing(custtype);
   %if &custtype= %then %do;
		proc print data=orion.customer noobs;
   		var Customer_ID Customer_Name Customer_Type_ID;
   		title "All Customers"; 
		run;
   %end;
   %else %do;
		proc print data=orion.customer noobs;
      	where Customer_Type_ID=&custtype;
         var Customer_ID Customer_Name;
         title "Customer Type: &custtype";
      run;
	%end;
%mend listing;

%listing(1020)
%listing()
