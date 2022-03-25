#!/usr/bin/bash -l
#SBATCH -a 1-34 -J sortbam -o sortbam.%a.log -p short -N 1 -n 16 --mem 16gb 

module load samtools

N=${SLURM_ARRAY_TASK_ID}
CPUS=$SLURM_CPUS_ON_NODE

file=$(ls *.sort_name.bam | sed -n ${N}p)
b=$(basename $file .sort_name.bam)
if [ ! -f $b.sort_name_bx.bam ]; then
	samtools sort -@ $CPUS  -T /scratch/$$  -tBX -o $b.sort_name_bx.bam $file
fi
