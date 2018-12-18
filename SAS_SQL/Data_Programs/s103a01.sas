*** s103a01 ***; 

/* Submit the program and view the results.            */
/*                                                     */
/* Modify the program by                               */
/*   - adding an option in the PROC SQL statement so   */
/*     that the rows in the first report are numbered. */
/*   - adding a new statement with the appropriate     */
/*     option after the first select statement so      */
/*     rows in the second report are not numbered.     */
/* Resubmit the program and view the results.          */
/*                                                     */
/* Which option, NUMBER or NONUMBER applies to the     */ 
/* third report report?                                */
/*                                                     */

proc sql ;
title 'Executives';
   select employee_id, job_title
   from orion.employee_organization
   where department = 'Executives';

title 'Strategy';
   select employee_id, job_title
   from orion.employee_organization
   where department = 'Strategy';

title 'Group Financials';
   select employee_id, job_title
   from orion.employee_organization
   where department = 'Group Financials';
quit;
title;
