#!/bin/bash

## Script for calculate Fst

# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data:/data biocontainers/vcftools:0.1.15 vcftools"

mkdir -p ../../data/Fst

# Calcular Fst entre pares de poblaciones

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --out ../../data/Fst/taviche_vs_costeño

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --out ../../data/Fst/taviche_vs_tusta

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_taviche.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/taviche_vs_chiledeagua

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --out ../../data/Fst/costeño_vs_tusta

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_costeño.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/costeño_vs_chiledeagua

$vcftools --vcf ../../data/mexcollection.vcf --weir-fst-pop ../../data/samples_names/population_names/names_tusta.txt --weir-fst-pop ../../data/samples_names/population_names/names_chiledeagua.txt --out ../../data/Fst/tusta_vs_chiledeagua



