#!/bin/bash

# This script is to calculate the nucleotide diversity by population


# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data:/data biocontainers/vcftools:0.1.15 vcftools"

## Calculate the nucleotide diversity of the Taviche population 
$vcftools --vcf ../../data/vcf_files_by_population/taviche.vcf.recode.vcf --site-pi --out taviche_nd

## Calculate the nucleotide diversity of the Costeño population
$vcftools --vcf ../../data/vcf_files_by_population/costeño.vcf.recode.vcf --site-pi --out costeño_nd

## Calculate the nucleotide diversity of the Tusta population
$vcftools --vcf ../../data/vcf_files_by_population/tusta.vcf.recode.vcf --site-pi --out tusta_nd

## Calculate the nucleotide diversity of the Chile de agua population
$vcftools --vcf ../../data/vcf_files_by_population/costeño.vcf.recode.vcf --site-pi --out chiledeagua_nd


## move .sites.pi files to directory nucleotide_diversity
mv ../../data/*.sites.pi ../../data/nucleotide_diversity/

