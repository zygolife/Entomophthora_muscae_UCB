#!/usr/bin/bash
#SBATCH -p intel -n 1 --mem 64gb --out logs/02_arcs.log

module load arcs
datetime

ls aln/*.sort_name.bam > bams.fofn
GENOME=genome/emus_flye_assembly_medaka_polish.fasta
GRAPH=emus_flye_assembly_medaka_polish.scaffold_arcs.gv
BARCODE=barcode.arcs_counts.txt
DIST=emus_flye_assembly_medaka_polish.dist.tsv
TIGPAIR=emus_flye_assembly_medaka_polish.tigpair_checkpoint.tsv
F=emus_flye_assembly_medaka_polish.scaffold_arcs
time arcs --fofName=bams.fofn --file=$GENOME --graph=$GRAPH --barcode-counts=$BARCODE --dist_tsv=$DIST --dist_est
python scripts/makeTSVfile.py $GRAPH $TIGPAIR $GENOME

touch empty.fof
LINKS -f $GENOME -s empty.fof -k 20 -b $F -l 5 -t 2 -a 0.3

datetime
