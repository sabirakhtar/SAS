proc format;
   value benefit low-'31dec1993'd=[worddate20.]
                '01jan1994'd-high='** Not Eligible **';
run;

proc print data=orion.employeepayroll(obs=5) noobs;
   var employeeid employeehiredate;
   format employeehiredate benefit.;
   title 'Nested formats';
run;

title; 
