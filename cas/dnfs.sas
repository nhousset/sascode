cas;


caslib dnfsds DROP;

caslib dnfsds datasource=(srctype="dnfs") path="/opt/sas/dnfs";

proc casutil incaslib="dnfsds" outcaslib="dnfsds";
   list files;
quit;

caslib _all_ assign;

data dnfsds.test;
set sashelp.prdsale;
run;


proc casutil ;
save incaslib='dnfsds' casdata='test' outcaslib='dnfsds' casout='test';
run;
