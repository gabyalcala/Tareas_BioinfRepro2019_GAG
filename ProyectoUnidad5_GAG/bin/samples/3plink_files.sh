#!/bin/bash

# This script generates files in plink y structure format 

# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data/vcf_files_by_population:/data/biocontainers/vcftools:0.1.15 vcftools"

# run vcftools and make plink files
$vcftools --vcf ../../data/vcf_files_by_population/fourpopulations.vcf.recode.vcf --out fourp --plink

# move .ped and .map files to directory admixture
mv ../../data/fourp.ped ../../data/admixture/
mv ../../data/fourp.map ../../data/admixture/

# run plink
# make .bed file 
./plink --file ../../data/admixture/fourp --make-bed --out ../../data/admixture/fourp

# make structure file 
./plink --vcf ../../data/vcf_files_by_population/fourpopulations.vcf.recode.vcf --recode structure --out ../../data/fourpop



