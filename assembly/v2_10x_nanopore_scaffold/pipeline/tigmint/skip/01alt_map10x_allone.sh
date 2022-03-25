#!/usr/bin/bash
#SBATCH -p short -w x01 -N 1 -n 64 --mem 128gb --out logs/map_10x.r.log
module load bwa
module load bwa-mem2/2.2.1
module load samtools/1.11
CPUS=$SLURM_CPUS_ON_NODE
ALN=aln
GENOME1=genome/bwa1/emus_flye_assembly_medaka_polish.fasta
GENOME2=genome/emus_flye_assembly_medaka_polish.fasta
mkdir -p $ALN
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS
date
hostname

NAME=Emus_10x_ONT
READS=EmusUCB_10X/outs/barcoded.fastq.gz
FWD=EmusUCB_10X/outs/barcoded_R1.fq.gz
REV=EmusUCB_10X/outs/barcoded_R2.fq.gz

TEMP=/scratch/$NAME.$$

if [ ! -s $ALN/$NAME.sort.bam ]; then
	mkdir -p $TEMP
	#which bwa-mem2
	#bwa-mem2 mem -C -t $CPU -p $GENOME2 $READS | samtools view -u -F4 > $TEMP/$NAME.sam
	bwa-mem2 mem -C -t $CPU $GENOME2 $FWD $REV > $TEMP/$NAME.sam
	samtools sort -n -T $TEMP/$NAME -m 2G --threads $CPU -tBX -o $ALN/$NAME.sort_name.bam $TEMP/$NAME.sam
	#bwa mem -C -t $CPU -p $GENOME1 $READS | samtools view -u -F4 > $TEMP/$NAME.sam
	rm -rf $TEMP
fi
