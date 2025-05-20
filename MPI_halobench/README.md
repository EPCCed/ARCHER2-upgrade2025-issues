# Halobenchmark

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


