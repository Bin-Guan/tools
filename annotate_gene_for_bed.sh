#11/21/18 prepare bed files for ConVaDING

module load bedtools

bedtools intersect -wao -a ../Coloboma_capture_regions.nr.bed -b ~/bed/knownCanonical.genome.hg19.txt | awk -F '\t' 'BEGIN { OFS = "\t" } {print $1,$2,$3,$8}' - > Coloboma_capture_regions.genename.bed

bedtools intersect -wao -a ../Coloboma_Rd2_capture_regions.nr.bed -b ../../rd1/bedprep/Coloboma_capture_regions.genename.hg19.bed | awk -F '\t' 'BEGIN { OFS = "\t" } {print $1,$2,$3,$8}' - > Coloboma_Rd2_capture_regions.genename.bed

#get the ones without gene name "."

grep -P "\." Coloboma_Rd2_capture_regions.genename.bed | bedtools intersect -wao -a - -b ~/bed/knownCanonical.genome.hg19.txt | awk -F '\t' 'BEGIN { OFS = "\t" } {print $1,$2,$3,$8}' - | grep -v -e "-AS" - > new.bed

# then edit new.bed

grep -v -P "\." Coloboma_Rd2_capture_regions.genename.bed | cat - new.bed | bash ~/my_code_note/sort_bed_hg19.sh - sorted.bed 

grep -v -e "LRBA" -e "TIMM17B"

#sort
