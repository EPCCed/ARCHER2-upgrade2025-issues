# Modulefile missing for cray-mpich

Steps to reproduce:

```bash
module load cpe/22.12
```

gives:

```bash
Lmod has detected the following error:  These module(s) or extension(s) exist but cannot be loaded as requested: "cray-mpich/8.1.23"
   Try: "module spider cray-mpich/8.1.23" to see how to load the module(s).

Executing this command requires loading "cray-mpich/8.1.23" which failed while processing the following module(s):

    Module fullname  Module Filename
    ---------------  ---------------
    cpe/22.12        /opt/cray/pe/lmod/modulefiles/core/cpe/22.12.lua

```

This works as expected on the current production image.

Note: Cray MPICH 8.1.23 seems to be installed in `/opt/cray` on the nodes so it is likely it is just the 
modulefile that is missing.

