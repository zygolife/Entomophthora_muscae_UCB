Entomophthora muscae strain UCB genome assembly, annotation, genome completeness, and transposon content
==

Assembly
====
Primary [nanopore data](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP363781) was generated at the [Harvard Bauer Core facility](https://bauercore.fas.harvard.edu/) and initially assembly by C. Elya and then later scaffolded with [10X data](https://ncbi.nlm.nih.gov/sra/SRR18312935).

Repeat Masking was run in the [RM_Run](/RM_run) folder which provides an archive of the repeat modeler results. Archives of the produced repeat libraries and reports are also provided in the (repeatmasker_plots)[/repeatmasker_plots] and (repeatmasker_reports)[repeatmasker_reports] folders.

Annotation
====
Archive of genome repeat masking and genome annotation process with Funannotate for _Entomopthora muscae_ genome and comparisons among related species. The annotation folder contains pipeline folder for slurm job running on the [UCR HPCC](https://hpcc.ucr.edu). 

The approach uses public RNASeq data for transcript production and training gene predictors. Note that the public RNASeq are from different isolate which may be a cryptic species.

This workflow includies re-annotating public genomes in order to test hypotheses that gene content differences are due to real biological differences and not simply annotation pipeline differences.

Citation
====
This annotation and repeat data is used in the [Emuscae_Comparative](https://github.com/zygolife/Emuscae_Comparative) repository which is tightly linked to this one for the associated manuscript.

Jason E Stajich, Brian Lovett, Emily Lee, Angie M. Macias, Ann E Hajek, Benjamin L de Bivort, Matt T. Kasson, Henrik H. De Fine Licht, Carolyn Elya. Signatures of transposon-mediated genome inflation, host specialization, and photoentrainment in Entomophthora muscae and allied entomophthoralean fungi. _Submitted_.

Curated by Jason Stajich - jason.stajich[AT]ucr.edu @hyphaltip [Lab Site](https://lab.stajich.org)
