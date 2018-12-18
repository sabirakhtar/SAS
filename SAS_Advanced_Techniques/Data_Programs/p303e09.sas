proc means data=ccdonations sum n nonobs maxdec=2;
   class DonationCategory;
   var TotalDonations;
run;
