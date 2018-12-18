data ccdonations / view=ccdonations;
   set orion.employeedonations;
   length DonationCategory $15; 
   where PaidBy='Credit Card';
   TotalDonations=sum(of Qtr1 - Qtr4);
   if TotalDonations >= 100 then DonationCategory='$100 or more';
   else DonationCategory='Less than $100';  
run;

proc means data=ccdonations sum n nonobs maxdec=2;
   class DonationCategory;
   var TotalDonations;
run;


