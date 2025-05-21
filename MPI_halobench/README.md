# Halobenchmark

## Note

No output to stderr seen when running these benchmarks and all output to stdout provided below.

## Symptoms

When the new image is used in 128 process single node testing the performance of the MPI benchmark is significantly worse.

### Reference result 

compiled ln01, run on production partition.

```
 Simple haloswap benchmark
 -------------------------

 Running on  128  process(es)
 Process grid is ( 8 ,  4 ,  4 )
 Each halo contains 10000  doubles

 Total amount of halo data =  0.457763671875  MiB per process

 Number of repetitions =  1000
 Clock resolution is  4.44444444444444412E-4  microseconds

 Sendrecv
 --------
 Secs =  7.46616403933254014E-2 , bwidth =  6131.1761898540226  MiB/s


 Redblack
 --------
 Secs =  6.19957200340220255E-2 , bwidth =  7383.7947462145503  MiB/s


 Isend / Recv / Wait
 -------------------
 Secs =  5.54805804499778274E-2 , bwidth =  8250.8810859995774  MiB/s


 Irecv / Send / Wait
 -------------------
 Secs =  5.75347398548957598E-2 , bwidth =  7956.3003679080311  MiB/s


 Irecv / Isend / Wait (pairwise)
 -------------------------------
 Secs =  5.63998100622519413E-2 , bwidth =  8116.4044944431207  MiB/s


 Irecv / Isend / Waitall
 -----------------------
 Secs =  3.76586497341057508E-2 , bwidth =  12155.605023204642  MiB/s


 Persistent / Startall / Waitall
 -------------------------------
 Secs =  6.54714400219276182E-2 , bwidth =  6991.8069882331338  MiB/s


 Neighbourhood Collective
 ------------------------
 Secs =  3.51716710408953026E-2 , bwidth =  13015.124340914668  MiB/s


 Finished
 --------

```

### Anomolous results

Compiled ln04, run on z19-upgrade2025 reservation


```
 Simple haloswap benchmark
 -------------------------

 Running on  128  process(es)
 Process grid is ( 8 ,  4 ,  4 )
 Each halo contains 10000  doubles

 Total amount of halo data =  0.457763671875  MiB per process

 Number of repetitions =  1000
 Clock resolution is  4.44998418030623894E-4  microseconds

 Sendrecv
 --------
 Secs =  0.14058780597526646 , bwidth =  3256.069533907757  MiB/s


 Redblack
 --------
 Secs =  7.7461561258911904E-2 , bwidth =  5909.559069496996  MiB/s


 Isend / Recv / Wait
 -------------------
 Secs =  9.6828680948662274E-2 , bwidth =  4727.5628190959487  MiB/s


 Irecv / Send / Wait
 -------------------
 Secs =  5.81458353261445626E-2 , bwidth =  7872.6820125184813  MiB/s


 Irecv / Isend / Wait (pairwise)
 -------------------------------
 Secs =  0.11155230044194504 , bwidth =  4103.5789496177449  MiB/s


 Irecv / Isend / Waitall
 -----------------------
 Secs =  3.80696022024450895E-2 , bwidth =  12024.388104733054  MiB/s


 Persistent / Startall / Waitall
 -------------------------------
 Secs =  1.1990192955763941 , bwidth =  381.78173909615299  MiB/s


 Neighbourhood Collective
 ------------------------
 Secs =  3.68133084786642917E-2 , bwidth =  12434.733274253354  MiB/s


 Finished
 --------
```

## Pre-requisites

Access to the repository https://github.com/davidhenty/halobench

## How to reproduce

Login to either ln01,2,3 or ln04 depending on the image being tested.

Clone the repository https://github.com/davidhenty/halobench

Compiler using `make -f Makefile-archer2`

Run using the relevant archer2.job script:

    archer2-old.job for the current production image.
    archer2-new.job for the image in the test partition.

## TDS results


### Reference image

```
 Simple haloswap benchmark
 -------------------------

 Running on  128  process(es)
 Process grid is ( 8 ,  4 ,  4 )
 Each halo contains 10000  doubles

 Total amount of halo data =  0.457763671875  MiB per process

 Number of repetitions =  1000
 Clock resolution is  4.44247790755736597E-4  microseconds

 Sendrecv
 --------
 Secs =  7.64285671654856835E-2 , bwidth =  5989.431554877051  MiB/s


 Redblack
 --------
 Secs =  6.25789976430313477E-2 , bwidth =  7314.9729001128462  MiB/s


 Isend / Recv / Wait
 -------------------
 Secs =  5.57185151678142448E-2 , bwidth =  8215.6473570104536  MiB/s


 Irecv / Send / Wait
 -------------------
 Secs =  5.86608631514403331E-2 , bwidth =  7803.5618175822956  MiB/s


 Irecv / Isend / Wait (pairwise)
 -------------------------------
 Secs =  5.89816398453432839E-2 , bwidth =  7761.1214790790755  MiB/s


 Irecv / Isend / Waitall
 -----------------------
 Secs =  3.80589729027093551E-2 , bwidth =  12027.746335803313  MiB/s


 Persistent / Startall / Waitall
 -------------------------------
 Secs =  6.53827283616268407E-2 , bwidth =  7001.2935119982203  MiB/s


 Neighbourhood Collective
 ------------------------
 Secs =  3.46395260522457879E-2 , bwidth =  13215.067411273711  MiB/s


 Finished
 --------
```

### New image

```
 Simple haloswap benchmark
 -------------------------

 Running on  128  process(es)
 Process grid is ( 8 ,  4 ,  4 )
 Each halo contains 10000  doubles

 Total amount of halo data =  0.457763671875  MiB per process

 Number of repetitions =  1000
 Clock resolution is  4.44257856144863593E-4  microseconds

 Sendrecv
 --------
 Secs =  0.13745590874567329 , bwidth =  3330.2582337291415  MiB/s


 Redblack
 --------
 Secs =  6.50395633203399298E-2 , bwidth =  7038.23409176923  MiB/s


 Isend / Recv / Wait
 -------------------
 Secs =  9.06315647650792339E-2 , bwidth =  5050.8194695914426  MiB/s


 Irecv / Send / Wait
 -------------------
 Secs =  5.86283959690923825E-2 , bwidth =  7807.8832672878016  MiB/s


 Irecv / Isend / Wait (pairwise)
 -------------------------------
 Secs =  0.10864806798490992 , bwidth =  4213.2702436878917  MiB/s


 Irecv / Isend / Waitall
 -----------------------
 Secs =  3.76246675880860942E-2 , bwidth =  12166.583819067455  MiB/s


 Persistent / Startall / Waitall
 -------------------------------
 Secs =  1.087252873999875 , bwidth =  421.02778739130065  MiB/s


 Neighbourhood Collective
 ------------------------
 Secs =  3.74737109752379255E-2 , bwidth =  12215.594878699991  MiB/s


 Finished
 --------
```
