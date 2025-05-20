# VASP TiO2 benchmark: UCX performance issues 

## Symptom

When UCX transport layer is used, VASP performance for the TiO2 benchmark case
is 50% slower than expected when compared to equivalent runs on non-upgraded nodes.

- Elapsed time, Original nodes: 2029.804 s
- Elapsed time, Upgraded nodes: 3063.716 s

## Pre-requisites

Access to VASP via valid licence to test.

## Investigations so far

Timings from VASP output show that the slowdown is due to longer spent in MPI 
collective calls (MPI_Allreduce, MPI_Alltoallv, MPI_Alltoall).

## How to reproduce

Four job submission scripts are provided along with the required input files for
the VASP benchmark (all jobs are on 2 nodes):

- [submit-UCX-Original.slurm](submit-UCX-Original.slurm) : Run using UCX on un-upgraded nodes
- [submit-UCX-Upgraded.slurm](submit-UCX-Upgraded.slurm) : Run using UCX on upgraded nodes

Input files:
- input/INCAR.base
- input/KPOINTS
- input/POSCAR
- input/POTCAR

Once the job is finished, the time to solution can be found in the line containing
the `Elapsed time`, e.g.:

```
> grep "Elapsed time" *.OUTCAR
                         Elapsed time (sec):     2029.804

```

## Sample output

- Un-upgraded nodes: [TiO2MCC_UCX-Original_2nodes_128cores_1threads_64NCORE_9631915_202505191412.OUTCAR](TiO2MCC_UCX-Original_2nodes_128cores_1threads_64NCORE_9631915_202505191412.OUTCAR)
- Upgraded nodes: [TiO2MCC_UCX-Upgraded_2nodes_128cores_1threads_64NCORE_9631918_202505191412.OUTCAR](TiO2MCC_UCX-Upgraded_2nodes_128cores_1threads_64NCORE_9631918_202505191412.OUTCAR)


