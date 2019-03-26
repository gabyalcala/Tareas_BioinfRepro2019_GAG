#!/bin/bash


# Create a variable to run vcftools in docker
vcftools="docker run --rm -v /Users/gabyalcala/Desktop/Tareas_BioinfRepro2019_GAG/ProyectoUnidad5_GAG/data:/data biocontainers/vcftools:0.1.15 vcftools"

## run vcftools and make plink files
$vcftools --vcf ../../data/mexcollection.vcf --out mexcollection --plink

# move .ped and .map files to directory admixture
mv ../../data/mexcollection.ped ../../data/admixture/
mv ../../data/mexcollection.map ../../data/admixture/


# make bed file for plink
./plink --file ../../data/admixture/mexcollection --make-bed --out ../../data/admixture/mexcollection

