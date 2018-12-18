proc print data=orion.sales noobs;
	var Employee_ID First_Name Last_Name Job_Title;
	format First_Name Last_Name $upcase. Job_Title $quote.;
run;
