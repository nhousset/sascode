%put EASYSOFT_UNICODE=%sysfunc(sysget (EASYSOFT_UNICODE)); 
%put LANG=%sysfunc(sysget (LANG)); 
%put LD_LIBRARY_PATH=%sysfunc(sysget (LD_LIBRARY_PATH)); 
%put ODBCINI=%sysfunc(sysget (ODBCINI));
%put ODBCSYSINI=%sysfunc(sysget (ODBCSYSINI)); 
%put ODBCINSTINI=%sysfunc(sysget (ODBCINSTINI)); 


options sastrace='d,d,,d' sastraceloc=saslog nostsuffix sql_ip_trace=(note,source) msglevel=i fullstimer ;

libname risk1 odbc required="Driver=/opt/microsoft/msodbcsql18/lib64/libmsodbcsql-18.0.so.1.1;
Database=mySAS;Server=,2433;UID=;PWD="
trace=yes;

libname test odbc dsn="Databricks" uid="test" password="test";
libname testnih odbc dns="sqlServer" uid="SQL" password="";
cas;

caslib odbclib desc="Databricks"
datasource=(srctype="odbc"
username="username"
password="password"
database="Databricks"
catalog="*" );
 
caslib _all_ assign;
 
options msglevel=i;

proc casutil;
list tables incaslib="odbclib";
load casdata="class" incaslib="odbclib"
casout="class";
quit;
