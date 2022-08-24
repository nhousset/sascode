# ce code permet de test le nombre de CAS worker utilisé par la session
# *************************************************************************


options msglevel=i;
cas cas sessopts=(metrics=True);
caslib _all_ assign;

data casuser.cars; set sashelp.cars;run;

proc casutil;
list tables incaslib="casuser";
quit; 

proc cas;
table.tabledetails result=allhosts table="cars" level="node"; run;
print allhosts.tabledetails[,{"Node","Block","Active"}];
run;

cas cas disconnect;
