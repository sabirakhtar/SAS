/*********************/
/*  p210e01d         */
/*********************/


/********************/
/* Part D           */
/* Update Continent.*/
/********************/

/*************************************************/
/* When START and END are created using the      */
/* CNTLOUT= option, they are created as character*/
/*************************************************/


data continentfmt;
	set continentfmt orion.NewContinent;
run;
