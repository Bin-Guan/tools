#!/bin/bash

##Editing in excel: remove frameshift in column 2, remove the extra "," in the first column in the last row.
##Save as Tab-delimited file RUSH2A.txt.

awk 'gsub(/\r/,"")' RUSH2A.txt > RUSH2A.temp

cut -f 1,2 RUSH2A.temp | awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {$3 = "RUSH2A-AC"; print $0} NR>1 {$3 = gsub(/hom/, "", $1) + gsub(/\,/, "", $1) + 1; print $0}' - | cut -f 3 | paste RUSH2A.temp - > RUSH2A_AC.txt 

