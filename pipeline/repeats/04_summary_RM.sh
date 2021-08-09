#!/usr/bin/bash -l
module load miniconda3

./scripts/summarize_repeatmasker_comparative.py  -op summary_RM_pct.csv -o summary_RM.csv -d repeatmasker_reports
