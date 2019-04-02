#!/bin/bash

# This script run admixture

# Run admixture for K 1-5

for K in 1 2 3 4 5; do ./admixture --cv ../../data/admixture/fourp.bed $K | tee ../../data/admixture/log${K}.out;
done

# move Q and P files to admixture directory

mv *.P ../../data/admixture/
mv *.Q ../../data/admixture/

# make file to save CV error

grep -h CV ../../data/admixture/log*.out > ../../data/admixture/CV_error.txt

