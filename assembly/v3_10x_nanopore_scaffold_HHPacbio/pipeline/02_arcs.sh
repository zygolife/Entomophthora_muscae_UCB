#!/usr/bin/bash -l
#SBATCH -p short -N 1 -n 8 -C xeon --mem 96gb --out logs/arcs.log
#

# these resources assume the aln files were already made since that runs more 
# efficiently separated among diff nodes

module load arcs
module load minimap2/2.18

CPUS=$SLURM_CPUS_ON_NODE
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS

arcs-make arcs-long draft=Emusc_scaf10X reads=PacBio_JGI m=8-10000 s=70 c=4 l=4 a=0.3 z=1000
