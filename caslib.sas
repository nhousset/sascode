/* PostgreSQL Multi Node Serial */
caslib pgdvd datasource=(
srctype="postgres",
username="casdm",
password="xxxxxx",
server="sasdb.race.sas.com",
database="dvdrental",
schema="public",
numreadnodes=3) ;

/* HDP Parallel - Connect Accelerator */
caslib cashive datasource=(
srctype="hadoop",
server="sascdh01.race.sas.com",
username="sastest1",
dataTransferMode="parallel",
hadoopconfigdir="/opt/MyHadoop/CDH/Confs",
hadoopjarpath="/opt/MyHadoop/CDH/Jars",
schema="default") ;


/* ORACLE Lib */
libname loradm oracle user="casdm" password="xxxxxx"
path="//sasdbms.race.sas.com:1521/xe" schema="casdm" ;

/* CAS LASR LIB */
caslib caslasr datasource=(
srctype="lasr",
server="sasdb.race.sas.com",
port=10031,
signer="http://sasdb:80/SASLASRAuthorization",
username="sasdemo",
password="*******",
tag=VAPUBLIC
) ;

/* Assign Std HIVE CASLIB */
caslib hivelib desc="Hive Caslib"
datasource=(SRCTYPE="hadoop",SERVER="xxx.hadoop.com",
HADOOPCONFIGDIR="/opt/sas/hadoop/client_conf",
HADOOPJARPATH="/opt/sas/hadoop/client_jar",
schema="default",dfDebug=sqlinfo);
cas hivelib list;

/*Assign Impala CASLIB*/
caslib imcaslib desc="Impala Caslib"
datasource=(srctype="impala",
username="impalauser",
server="impala.example.com");

/* Assign EP HIVE CASLIB*/
caslib hiveEP datasource=(srctype="hadoop" server="xx.hadoop.com"
dataTransferMode="parallel",
hadoopconfigdir="/opt/sas/adoop/client_conf",
hadoopjarpath="/opt/sas/hadoop/client_jar");

/* Assign HDFS caslib */
caslib public datasource=(srctype="hdfs") path="/test";
caslib _alL_ assign,
calib public list; 

/*Assign SPDE caslib*/
caslib spdecas desc='SPDE Caslib'
datasource=(srctype='spde',
username="sastest1",
hdfs="true",
dataTransferMode="serial",
hadoopconfigdir="/opt/MyHadoop/CDH/Confs",
hadoopjarpath="/opt/MyHadoop/CDH/Jars",
mdfpath="/user/sastest1/spdetest/meta",
datapath="/user/sastest1/spdetest/data");


/*Assign HDMD datasrouce caslib */
caslib hdmdlib desc="hdmd caslib" dataSource=(srctype='hadoop', 
dataTransferMode='serial',
username='myuser1',
hadoopJarPath='/hadoop/jars',
hadoopConfigDir='/hadoop/conf',
hadoopDataDir='/data/referencesfiles',
hadoopMetaDir='/data/referencefiles/metadata');
