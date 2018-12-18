/* m102s11 */ 

/* Part A */
%let fullname=Anthony Miller;

/* Part B */
%let newname=%substr(&fullname,1,1). %scan(&fullname,2);
%put &newname;

/* Alternate solution: */
%let initial=%substr(&fullname,1,1);
%let last=%scan(&fullname,2);
%let newname=&initial.. &last;
%put &newname;
