#!/usr/bin/bash
#SBATCH -p short --mem 32gb --out logs/02_arcs.log

module load miniconda3
conda activate abbitr
GENOME=genome/canu2.ctgs_unasm.fa
BAM=Citrus10x.all.sort.bam
./ARBitR/src/arbitr.py -i $GENOME $BAM >& arbitr.log
