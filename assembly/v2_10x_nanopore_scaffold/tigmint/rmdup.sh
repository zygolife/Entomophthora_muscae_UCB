#!/usr/bin/bash -l
#SBATCH -p intel,batch -n 24 -N 1 --mem 64gb --out rmdup.log

module load AAFTF
which minimap2
CPUS=$SLURM_CPUS_ON_NODE
if [ -z $CPUS ]; then
 CPUS=1
fi
CPU=$CPUS


#ln -s emus_flye_assembly_medaka_polish.EmusUCB_10X.as0.65.nm5.molecule.size2000.trim0.window1000.span20.breaktigs.EmusUCB_10X.c5_e30000_r0.05.arcs.a0.1_l10.links.scaffolds.fa original_links.scaffolds.fa
IN=Emus.linked.5kb.fa
AAFTF rmdup -ml 1000 -i $IN -c $CPU -w /scratch/Emus_rmdup/ -o Emus.5kb.scaffolds.rmdup.fa
