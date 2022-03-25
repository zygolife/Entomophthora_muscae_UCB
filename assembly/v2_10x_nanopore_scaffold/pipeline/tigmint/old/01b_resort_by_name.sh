#!/usr/bin/bash -l
#SBATCH -p short -N 1 -n 64 --mem 128gb --out logs/resort_bam.log

module load samtools/1.11
CPUS=$SLURM_CPUS_ON_NODE
ALN=aln
PREFIX=Emus_10x_ONT
mkdir -p $ALN
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS

samtools sort --threads $CPUS -tBX -T /scratch/tigmint$$ -n -o $ALN/$PREFIX.sort_name2.bam $ALN/$PREFIX.sort_name.bam
