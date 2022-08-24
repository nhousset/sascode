options sastrace='d,d,,d' sastraceloc=saslog nostsuffix sql_ip_trace=(note,source) msglevel=i fullstimer ;



options msglevel=i;

cas casauto sessopts=(caslib=casuser metrics=True);


caslib _all_ assign;
 

data casuser.cars; set sashelp.cars;run;



proc casutil;
list tables incaslib="casuser";
quit; 

proc cas;
table.tabledetails result=allhosts table="casuser" level="node"; run;
print allhosts.tabledetails[,{"Node","Block","Active"}];
run;
