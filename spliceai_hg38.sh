#!/bin/bash

#spliceai hg38 from VEP hgvs conversion
#$1 has to be bgzipped and indexed.
#$2 is output tsv file
module load spliceai/1.3

module load VCF-kit

if [ ! -z "$3" ]; then
spliceai -I $1 -O tempSpliceai.vcf.gz -R /fdb/GATK_resource_bundle/hg38/Homo_sapiens_assembly38.fasta -A grch38 -D $3
else
spliceai -I $1 -O tempSpliceai.vcf.gz -R /fdb/GATK_resource_bundle/hg38/Homo_sapiens_assembly38.fasta -A grch38
fi

vk vcf2tsv wide --print-header tempSpliceai.vcf.gz > temphg38.tsv
cut -f 1-5,$(head -1 temphg38.tsv | sed "s/\t/\n/g" | grep -n "SpliceAI" | cut -f 1 -d:) temphg38.tsv \
| awk -F"\t" 'BEGIN{OFS="\t"} !/,/ {split($6, splices, "|"); max = splices[3]; for(m = 3; m <=6; m++) {if(max<splices[m]) max = splices[m]} print $0,max} /,/ {n = split($6,annotation,","); max = 0; for (i = 1; i <=n; i++) {split(annotation[i],splices,"|"); for(m = 3; m <=6; m++) {if(max<splices[m]) max = splices[m]}; }; print $0,max }' - \
| awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {$7="spliceai_maxscore"; print $0} NR>1 {if ($6==".") {$7="."; print $0} else {print $0} }' - \
| awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {$8="spliceai_rank"; print $6, $7, $8} NR>1 { if ($7==".") {$8 = 0} else { if ($7 >= 0.8) {$8 = 8} else {if ($7 >= 0.5) {$8 = 6} else {if ($7 >= 0.2) {$8 = 3} else {if ($7 >= 0.15) {$8 = 1} else {$8 = 0}}} }}; print $6, $7, $8}' -  > temp.cut.tsv

cut -f 1-5 temphg38.tsv | paste - temp.cut.tsv > $2
rm temp*

