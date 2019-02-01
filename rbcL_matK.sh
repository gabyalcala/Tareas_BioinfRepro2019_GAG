#!/bin/bash
### Script para bajar cuatro secuencias de rbcL y una de matK de Physalis philadelphica de NCBI

## Directiorio para guardar datos
mkdir -p P.philadelphica

## Bajar las secuencias de NCBI
curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=1316023768,1316021944,1316023142,1316021738,156628893" > P.philadelphica/rbcL_matK.fasta

# Revisar qué secuencias se bajaron
grep ">" P.philadelphica/rbcL_matK.fasta

# Contar cuantas veces aparece la secuencia "TGCA"
grep -c "TGCA" P.philadelphica/rbcL_matK.fasta
