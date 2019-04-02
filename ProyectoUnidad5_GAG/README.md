# README
This directory contains data and scripts generated from the study entitled [Genome‐wide genotyping of a novel Mexican Chile Pepper collection illuminates the history of landrace differentiation after Capsicum annuum L. domestication](https://onlinelibrary.wiley.com/doi/abs/10.1111/eva.12651) and is divided into the following subdirectories:

* **bin**

It has the scripts that were used for analyzing the data.

  **samples**
  
  1.- Extract the names of each sample [./bin/samples/1samples_name.sh](./bin/samples/1samples_name.sh)
  2.- To filter and make the vcf files by populations [./bin/samples/2filter_bypopulation.sh](./bin/samples/2filter_bypopulation.sh)
  3.- Convert to plink and structure format [./bin/samples/3plink_files.sh](./bin/samples/3plink_files.sh)
   **diversity** contains the scripts to calculate:
   4.-Nucleotide diversity [./bin/diversity/4nucleotide_diversity.sh](./bin/diversity/4nucleotide_diversity.sh)
   5.-Expected (H<sub>exp</sub>) and observed (H<sub>obs</sub>) heterozygosities, F<sub>ST</sub>, Pairwise F<sub>ST</sub> and Neighbor-Joining Tree [./bin/diversity/5genpop.R](./bin/diversity/5genpop.R)
   **popultaion_structure** contains the scripts to run:
   6.- ADMIXTURE analysis [./bin/population_structure/6admixture.sh](./bin/population_structure/6admixture.sh)
   7.-Discriminant analysis of principal components (DAPC) [./bin/population_structure/6admixture.sh](./bin/population_structure/7DAPC.R)
   
* **data**

It contains data in file in variant call format (vcf) from the study made by Taitano N, Bernau V, Jardón-Barbolla L, Leckie B, Mazourek M, Mercer K, McHale L, Michel A, Baumler D, Kantar M, van der Knapp E (2018) Data from: Genomewide genotyping of a novel Mexican Chile Pepper collection illuminates the history of landrace differentiation after Capsicum annuum L. domestication. Dryad Digital Repository [https://doi.org/10.5061/dryad.f1782h7](https://datadryad.org/resource/doi:10.5061/dryad.f1782h7)
These directories contain the output files of:
admixture
samples_names
vcf_files_by_population
F<sub>ST</sub>
nucleotide_diversity

* **metadata**

It has the file with the collection data of each sample.

* **figures**

It has the script used to produce admixture plot [./figures/plot_admixture.R](./figures/plot_admixture.R), the figures of the [Neighbor-Joining tree](./figures/NJ_tree.png) and [Observed Heterozygosity](./figures/Heterozygosity.png)


