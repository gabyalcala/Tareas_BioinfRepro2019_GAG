#!/bin/bash

# This script extracts the names of each sample from the mexcollection.vcf file and saves the output as names_mexcollection.txt

grep -oE "SAMPLE=<ID=\w+-[0-3]:\w+" ../../data/mexcollection.vcf > ../../data/samples_names/names_mexcollection.txt 


