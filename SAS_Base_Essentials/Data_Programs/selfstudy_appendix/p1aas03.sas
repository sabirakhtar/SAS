proc export data=orion.mnth7_2011 
            outfile="&path\mnth7.xls" 
            dbms=excelcs replace;
run;
