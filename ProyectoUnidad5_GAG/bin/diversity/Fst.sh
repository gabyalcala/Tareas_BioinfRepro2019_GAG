#!/bin/bash

## Script for calculate Fst

# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data:/data biocontainers/vcftools:0.1.15 vcftools"

# Make directory to save output file for Fst
mkdir -p ../../data/Fst

# Run vcftools for calculate Fst between population pairs

# Taviche vs Costeño
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --out ../../data/Fst/taviche_vs_costeño

# Taviche vs Tusta
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --out ../../data/Fst/taviche_vs_tusta

# Taviche vs Chile de agua
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/taviche_vs_chiledeagua

# Costeño vs Tusta
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --out ../../data/Fst/costeño_vs_tusta

#Costeño vs Chile de agua
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/costeño_vs_chiledeagua

# Tusta vs Chile de agua 
$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/tusta_vs_chiledeagua 



