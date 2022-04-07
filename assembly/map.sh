#!/usr/bin/bash -l
#SBATCH -p short -C ryzen -N 1 -n 128 --mem 256gb --out map.log 

module load minimap2
module load BBMap
module load workspace/scratch
CPU=128
minimap2 -t $CPU -x map-ont ../Entomophthora_muscae_UCB/annotate/Entomophthora_muscae_UCB.Nanopore10X_v2/annotate_results/Entomophthora_muscae_UCB.scaffolds.fa -a Nanopore/Emuscae_ONT_2021-03-14_passedReads.fastq.gz > $SCRATCH/Emusc.ONT_map.sam

 pileup.sh in=$SCRATCH/Emusc.ONT_map.sam out=Nanopore_stats.txt hist=Nanopore_histogram.txt
