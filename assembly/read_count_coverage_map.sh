#!/usr/bin/bash -l
#SBATCH -p intel,batch -N 1 -n 48 --mem 96gb --out map.log  --time 48:00:00

module load minimap2
module load BBMap
module load workspace/scratch
CPU=48
time minimap2 -t $CPU -x map-ont ../Entomophthora_muscae_UCB/annotate/Entomophthora_muscae_UCB.Nanopore10X_v2/annotate_results/Entomophthora_muscae_UCB.scaffolds.fa -a Nanopore/Emuscae_ONT_2021-03-14_passedReads.fastq.gz > $SCRATCH/Emusc.ONT_map.sam

 pileup.sh in=$SCRATCH/Emusc.ONT_map.sam out=Nanopore_stats..txt hist=Nanopore_histogram.2.txt
