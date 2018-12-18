 /*  Windows and UNIX DATA step */
data numbers;
   input Value;
   datalines;
8191
8192
8193
8194
;

 /*  z/OS DATA step */
 /*
data numbers;
   input Value;
   datalines;
269
270
271
272
;
 */
data temp;
   set numbers;
   X=Value;
   do L=8 to 1 by -1;
      if X NE trunc(X,L) then
      do;
         MinLen=L+1;
         output;
         return;
      end;
   end;
run;

title;
proc print data=temp noobs;
   var Value MinLen;
run;
