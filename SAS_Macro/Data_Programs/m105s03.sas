*m105s03;

%macro where(state);
   %if &state=%str(OR)
		%then %put Oregon;
		%else %put Wherever;
%mend where;

%where(CA)
