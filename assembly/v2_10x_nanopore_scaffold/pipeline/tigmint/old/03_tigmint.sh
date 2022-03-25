#!/usr/bin/bash
#SBATCH -p batch -N 1 -n 1 --mem 24gb --out logs/tigmint-molecule.%a.log

module load arcs
N=1
DIR=aln
INEXT=sort.bam
OUTEXT=reads.molecule.bed
IN=$(ls $DIR/*.$INEXT | sed -n ${N}p)
BASE=$(basename $IN .$INEXT)

if [ ! -s $BASE.$OUTEXT ]; then
  time tigmint-molecule --bed -w $BASE.tigmint.bam $IN | sort -k1,1 -k2,2n -k3,3n > $BASE.$OUTEXT
fi
