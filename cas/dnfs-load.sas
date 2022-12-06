
cas nhousset sessopts=(metrics=true);

proc cas;
accessControl.assumeRole / adminRole="superuser";
  action log / logger='App.cas.tkcastkts' level='trace';
 action log / logger='App.cas.datastep' level='trace';
 action log / logger='App.cas' level='trace';
 quit;

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



proc cas;
	table.tableinfo / table='dnfsds';
	table.tableDetails / table='dnfsds';
quit;


/* path */

caslib caslibpath path="/opt/sas/dnfs" datasource=(srctype="path") ;    

caslib _all_ assign;   

proc cas;
   table.loadtable /path="testA.sashdat" casOut={name="caslibpath"};
   print _perf;
run; 
