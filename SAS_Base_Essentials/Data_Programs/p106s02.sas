data work.assistant;
   set orion.staff;
   where Job_Title contains 'Assistant' and 
   	   Salary<26000;
	Increase=Salary*.10;
	New_Salary=Salary+Increase;
run;

proc print data=work.assistant;
	id Employee_ID;
	var Job_Title Salary Increase New_Salary;
	format Salary Increase New_Salary dollar10.2;
run;
