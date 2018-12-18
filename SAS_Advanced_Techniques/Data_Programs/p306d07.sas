data _null_;   
   drop rc;
   length ContinentName $ 30;
   if _n_=1 then do;
      call missing(ContinentName);
      declare hash ContName(dataset: 'orion.continent');
      ContName.definekey('ContinentID');
      ContName.definedata('ContinentName');
      ContName.definedone();
      declare hash C(multidata:'Y', ordered: 'ascending');  
      C.definekey('ContinentID');
      C.definedata('ContinentID','ContinentName', 'Country', 'CountryName', 'Population');
      C.definedone();
   end;
   set orion.country(keep=ContinentID Country CountryName Population) end=eof;
   rc=ContName.find();  
   rc=C.add();   			
   if eof then rc=C.output(dataset: 'work.countries');  
run;

proc print data=work.countries noobs;
   title 'work.countries with Duplicate ContinentID Values';
run;

