#!/usr/bin/bash
#SBATCH -p batch,intel -n 32 --mem 128gb --out RM.%A.log -N 1 

module load RepeatModeler
module load RepeatMasker
if [[ -z ${SLURM_CPUS_ON_NODE} ]]; then
    CPUS=1
else
    CPUS=${SLURM_CPUS_ON_NODE}
fi

NAME=Zoophthora_radicans_ATCC_208865.v1.sorted.fasta
PREFIX=$(basename $NAME .sorted.fasta)
if [ ! -f $PREFIX.nin ]; then
	BuildDatabase -engine rmblast -name $PREFIX $NAME
fi

RepeatModeler -pa $CPUS -database $PREFIX -LTRStruct
