#!/usr/bin/#!/usr/bin/env bash
#SBATCH -p short -N 1 -n 24 --mem 32gb

module load arcs
module load samtools

CPUS=$SLURM_CPUS_ON_NODE
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS
INEXT=reads.molecule.bed
OUTBEDFILE=Citrus10x.molecule.bed
OUTASM=Citrus.tigmint.fa
INGENOME=genome/canu2.ctgs_unasm.fa

if [ ! -f $INGENOME.fai ]; then
  samtools faidx $INGENOME
fi

sort -T /scratch -m -k1,1 -k2,2n -k3,3n -o $OUTBEDFILE *.$INEXT
tigmint-cut -p $CPU -o $OUTASM $INGENOME $OUTBEDFILE
