# Module files missing for HDF5 with ucx

Steps to reproduce ( currently on ln04, but I expect the same issue on the compute nodes ) : 

```bash
module load PrgEnv-gnu
module load cray-hdf5-parallel
module load craype-network-ucx 
module load cray-mpich-ucx 
```

I get 

```bash
Inactive Modules:
  1) cray-hdf5-parallel

```

and hdf5 is no longer loaded. This works as expected on the current production image.