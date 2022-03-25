#!/usr/bin/bash
#SBATCH -p batch,intel -N 1 -n 4 --mem 256gb --out links_iterate.log

#  ./runIterativeLINKS.sh 17 beluga.fa 5 0.3
K=19
GENOME=Emusc_scaf10X.fa
L=5
A=0.3
module load LINKS
LINKS -f $GENOME -s pb.fof -b links1 -d 1000 -t 10 -k $K -l $L -a $A
LINKS -f links1.scaffolds.fa -s pb.fof -b links2 -d 2500 -t 5 -k $K -l $L -a $A -o 1 -r links1.bloom
LINKS -f links2.scaffolds.fa -s pb.fof -b links3 -d 5000 -t 5 -k $K -l $L -a $A -o 2 -r links1.bloom
LINKS -f links3.scaffolds.fa -s pb.fof -b links4 -d 7500 -t 4 -k $K -l $L -a $A -o 3 -r links1.bloom
LINKS -f links4.scaffolds.fa -s pb.fof -b links5 -d 10000 -t 4 -k $K -l $L -a $A -o 4 -r links1.bloom
LINKS -f links5.scaffolds.fa -s pb.fof -b links6 -d 12500 -t 3 -k $K -l $L -a $A -o 5 -r links1.bloom
LINKS -f links6.scaffolds.fa -s pb.fof -b links7 -d 15000 -t 3 -k $K -l $L -a $A -o 6 -r links1.bloom
LINKS -f links7.scaffolds.fa -s pb.fof -b links8 -d 30000 -t 2 -k $K -l $L -a $A -o 7 -r links1.bloom


