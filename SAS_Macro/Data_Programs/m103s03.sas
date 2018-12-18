*m103s03;

%macro currtime;
   %sysfunc(time(),timeAMPM.)                                
%mend currtime;

proc print data=orion.customer_dim(obs=10);
   var Customer_Name Customer_Group;
	title 'Customer List';
	title2 "%currtime";
run;
