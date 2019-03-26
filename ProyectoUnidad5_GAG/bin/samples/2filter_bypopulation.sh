#!/bin/bash

# This script creates the vcf files of the populations Taviche, Costeño, Tusta y Chile de agua

# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data:/data biocontainers/vcftools:0.1.15 vcftools"

### Make the file for the taviche population 
$vcftools --vcf ../../data/mexcollection.vcf --remove ../../data/samples_names/only_taviche.txt --max-missing 0.9 --maf 0.05 --recode --recode-INFO-all --out taviche.vcf


### Make the file for costeño population 
$vcftools --vcf ../../data/mexcollection.vcf --remove ../../data/samples_names/only_costeño.txt --max-missing 0.9 --maf 0.05 --recode --recode-INFO-all --out costeño.vcf


### Make the file for tusta population
$vcftools --vcf ../../data/mexcollection.vcf --remove ../../data/samples_names/only_tusta.txt --max-missing 0.9 --maf 0.05 --recode --recode-INFO-all --out tusta.vcf

### Make the file for chile de agua population 
$vcftools --vcf ../../data/mexcollection.vcf --remove ../../data/samples_names/only_chiledeagua.txt --max-missing 0.9 --maf 0.05 --recode --recode-INFO-all --out chiledeagua.vcf

### move .recode.vcf files to directory vcf_files_by_population

mv ../../data/*.vcf.recode.vcf ../../data/vcf_files_by_population/