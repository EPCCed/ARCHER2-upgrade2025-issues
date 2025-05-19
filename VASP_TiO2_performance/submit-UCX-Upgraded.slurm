#!/bin/bash
#SBATCH --job-name=VASP-TiO2
#SBATCH --nodes=2
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=2
#SBATCH --time=6:0:0
#SBATCH --account=z19-upgrade2025
#SBATCH --partition=standard
#SBATCH --qos=reservation
#SBATCH --reservation=z19-upgrade2025

module load vasp/6/6.5.0
module load PrgEnv-gnu
module load craype-network-ucx
module load cray-mpich-ucx

VASP_EXE=vasp_gam

ncore=64
cpn=64
threads=1
nodes=$SLURM_JOB_NUM_NODES
casename="TiO2MCC"
srunopts="--hint=nomultithread --distribution=block:block"

export SLURM_CPU_FREQ_REQ=2250000

uuid=$(uuidgen)
rundir=${casename}_UCX-Upgraded_${uuid}

mkdir ${rundir}

cp input/KPOINTS ${rundir}/
cp input/POSCAR ${rundir}/
cp input/POTCAR ${rundir}/
cp input/INCAR.base ${rundir}/INCAR
echo "NCORE=${ncore}" >> ${rundir}/INCAR

cd ${rundir}

cores=$(( nodes * cpn ))
timestamp=$(date '+%Y%m%d%H%M')
resfile="${casename}_UCX-Upgraded_${nodes}nodes_${cores}cores_${threads}threads_${ncore}NCORE_${SLURM_JOB_ID}_${timestamp}.OUTCAR"
TMPDIR=$PWD

export OMP_NUM_THREADS=${threads}
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK
rm WAVECAR
srun ${srunopts} $VASP_EXE
sleep 30

mv OUTCAR ../${resfile}

cd ../
rm -r ${rundir}

