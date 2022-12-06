
cas nhousset sessopts=(metrics=true);


caslib dnfsds DROP;

caslib dnfsds datasource=(srctype="dnfs") path="/opt/sas/dnfs";

proc casutil incaslib="dnfsds" outcaslib="dnfsds";
   list files;
quit;

caslib _all_ assign;


proc cas;
   table.loadtable /path="testA.sashdat" casOut={name="dnfsds"};
   print _perf;
run; 
