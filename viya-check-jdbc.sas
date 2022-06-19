libname x JDBC driverclass=" com.databricks.client.jdbc.Driver"
 URL="jdbc:spark://community.cloud.databricks.com:443/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/4305041633684168/0618-164846-okgc0sts;AuthMech=3;UID=token;PWD=<personal-access-token>"
 user="dbadmin"
 database=""
 password="" 
 classpath="/opt/sas/jdbc_databricks/DatabricksJDBC42-2.6.25.1044/";
 
 cas;

 caslib jdcaslib desc='JDBC Caslib' 
   dataSource=(srctype='jdbc',                   
               url="jdbc:postgresql://viya.sas:5432/postgres",
               username='dbmsowner', 
               password='gF5va1hJIXnpUfKyMf85f6J4pdIT2XU'
               class="org.postgresql.Driver"
               classpath="/opt/Viya35/jdbc/drivers/postgresql/");
               
  
caslib _all_ assign;
 
options msglevel=i;

proc casutil;
list tables incaslib="jdcaslib";
load casdata="class" incaslib="jdcaslib"
casout="class";
quit;             
