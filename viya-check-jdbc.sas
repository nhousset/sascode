libname x JDBC driverclass=" com.databricks.client.jdbc.Driver"
 URL="jdbc:spark://community.cloud.databricks.com:443/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/4305041633684168/0618-164846-okgc0sts;AuthMech=3;UID=token;PWD=<personal-access-token>"
 user="dbadmin"
 database=""
 password="" 
 classpath="/opt/sas/jdbc_databricks/DatabricksJDBC42-2.6.25.1044/";
 
 
 caslib jdcaslib desc='JDBC Caslib' 
   dataSource=(srctype='jdbc',                   1
               url="jdbc:postgresql://<PostgreSQL-server>:<PostgreSQL-port>/
                        <PostgreSQL-database>",
               username='myuser1', 
               password='myPwd'
               class="org.postgresql.Driver"
               classpath="/opt/Viya35/jdbc/drivers/postgresql/");
               
               
