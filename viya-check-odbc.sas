%put EASYSOFT_UNICODE=%sysfunc(sysget (EASYSOFT_UNICODE)); 
%put LANG=%sysfunc(sysget (LANG)); 
%put LD_LIBRARY_PATH=%sysfunc(sysget (LD_LIBRARY_PATH)); 
%put ODBCINI=%sysfunc(sysget (ODBCINI));
%put ODBCSYSINI=%sysfunc(sysget (ODBCSYSINI)); 
%put ODBCINSTINI=%sysfunc(sysget (ODBCINSTINI)); 


options sastrace='d,d,,d' sastraceloc=saslog nostsuffix sql_ip_trace=(note,source) msglevel=i fullstimer ;

libname risk1 odbc required="Driver=/opt/microsoft/msodbcsql18/libmsodbcsql-18.0.so.1.1;
Database=mySAS;Server=viyabuildbox.franihviya.sashq-d.openstack.sas.com,2433;UID=sas;PWD=Orion123"
trace=yes;