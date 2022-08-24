# Ce code affiche la taille du CAS_CACHE_DISK
# *************************************************************************************************

options msglevel=i;

cas cas sessopts=(metrics=True);

proc cas;
    session cas;
    accessControl.assumeRole / adminRole="superuser";        
    builtins.getCacheInfo result=results;  
    describe results;
run;
    print results.diskCacheInfo;
run;
quit;

cas cas disconnect;
