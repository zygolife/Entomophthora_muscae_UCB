#!/usr/bin/bash
#SBATCH -p short -N 1 -n 64 --mem 128gb --out logs/tigmint_01.log
module load bwa
module load samtools/1.11
CPUS=$SLURM_CPUS_ON_NODE
ALN=aln
GENOME1=genome/bwa1/emus_flye_assembly_medaka_polish.fa
GENOME2=genome/emus_flye_assembly_medaka_polish.fasta
mkdir -p $ALN
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS
date
hostname

NAME=Emus_10x_ONT
READS=EmusUCB_10X/outs/barcoded.fq.gz
FWD=EmusUCB_10X/outs/barcoded_R1.fq.gz
REV=EmusUCB_10X/outs/barcoded_R2.fq.gz

TEMP=/scratch/$NAME.$$

tigmint-make arcs draft=$GENOME1 reads=$READS t=$CPU G=1G
