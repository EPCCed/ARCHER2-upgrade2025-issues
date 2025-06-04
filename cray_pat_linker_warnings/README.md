# CrayPAT linker warnings

Observed on `ln04`, the upgraded login node.

Steps to reproduce:

```bash
git clone https://github.com/EPCCed/single-node-optimisation-course.git

cd single-node-optimisation-course
git checkout 2024-11-12

cd Exercises
tar -xvf SNO.tar 
cd Archer2Opt/VH1/src

module load perftools
module load cray-hdf5
module load cray-netcdf

make
```

gives:

```bash
ftn -e mf -c vh1mods.f90
ftn -e mf -c zonemod.f90
ftn -e mf -c vhone.f90
...
ftn -pg -g  -o vh1-mpi-cray vh1mods.o zonemod.o vhone.o dtcon.o dump.o images.o init.o prin.o sweepx1.o sweepx2.o sweepy.o sweepz.o ppmlr.o forces.o flatten.o evolve.o remap.o states.o boundary.o volume.o riemann.o parabola.o ; mv vh1-mpi-cray ../bin

WARNING: PerfTools is saving object files from a temporary directory into directory '/home/z19/z19/mrb23cab/.craypat/vh1-mpi-cray/19416'
/opt/cray/pe/cce/16.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: warning: /tmp/mrb23cab/cpat19416/ldArgs.o: missing .note.GNU-stack section implies executable stack
/opt/cray/pe/cce/16.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
```

The executable can be instrumented with `pat_build` and when run the expected output is produced and can be processed by `pat_report`.

The linker warnings are not seen if compiling on a login node that has the original image.


Existing source files can be found in `/work/z19/shared/2025-05_upgrade-test/ln04/CrayPAT/single-node-optimisation-course/Exercises/Archer2Opt/VH1/src`.
