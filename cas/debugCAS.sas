cas mysession;
proc cas;  
accessControl.assumeRole / adminRole="superuser"; builtins.log result=results status=rc / level="TRACE" logger="App.cas.actions" onMain=true; 
run; 
quit; 
cas mysession terminate; /* The onMain=true statement is supposed to put the logging change into effect for all CAS sessions from this point forward, until CAS is restarted  */
