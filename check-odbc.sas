%put Site: &syssite    Release: &sysvlong    System: &sysscp &sysscpl;

%macro doit(command); 
  filename p pipe &command lrecl=32767; 
  data _null_; 
  infile p; 
  input; 
  put _infile_; 
  run; 
%mend; 

option LS=256; 
%doit("set"); 
%doit("whoami"); 
%doit('uname -a && cat /etc/*release');
%doit('locale');


%doit("which odbcinst");
%doit("/bin/odbcinst --version");
%doit("/bin/odbcinst -j");


%doit("/bin/isql -v SQLServerWire");
%doit("ldd /opt/sas/viya/home/lib64/accessclients/lib/S0sqls27.so");

%doit("ldd /bin/isql");
%doit("ls -l $SASROOT/sasexe/sasio* $SASROOT/sasexe/sasodbc*"); 
%doit("ls -l $SASROOT/bin/sasenv_local"); 
%doit("cat $SASROOT/bin/sasenv_local"); 
%doit("ls -l $ODBCHOME"); 
%doit("ls -l $ODBCHOME/lib/*"); 
%doit("file $ODBCHOME/lib/*"); 
%doit("ls -lrt $ODBCINI"); 
%doit("cat $ODBCINI"); 
%doit("echo $LD_LIBRARY_PATH"); 

%put EASYSOFT_UNICODE=%sysfunc(sysget (EASYSOFT_UNICODE)); 
%put LANG=%sysfunc(sysget (LANG)); 
%put LD_LIBRARY_PATH=%sysfunc(sysget (LD_LIBRARY_PATH)); 
%put ODBCINI=%sysfunc(sysget (ODBCINI)); 
