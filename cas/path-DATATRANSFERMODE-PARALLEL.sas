
cas nhousset sessopts=(metrics=true);

proc cas;
accessControl.assumeRole / adminRole="superuser";
  action log / logger='App.cas.tkcastkts' level='trace';
 action log / logger='App.cas.datastep' level='trace';
 action log / logger='App.cas' level='trace';
 quit;


caslib macas path="/opt/sas/dnfs" datasource=(srctype="path") 

caslib _all_ assign;   

proc cas;
   table.loadtable /path="testb.sas7bdat" casOut={name="testb"};
   importoptions=(filetype="basesas", dataTransferMode="parallel") ;
   print _perf;
run; 
