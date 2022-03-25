#!/usr/bin/bash -l
#SBATCH -p short -N 1 -n 64 -C xeon --mem 96gb --out logs/tigmint.log
#

# these resources assume the aln files were already made since that runs more 
# efficiently separated among diff nodes

module load tigmint
module load minimap2/2.18

CPUS=$SLURM_CPUS_ON_NODE
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS

tigmint-make tigmint-long draft=Emusc_scaf10X reads=PacBio_JGI span=auto G=1061980876 dist=auto t=$CPU longmap=pb
