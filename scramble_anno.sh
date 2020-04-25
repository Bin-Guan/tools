

for file in scramble/*.mei.txt; do
sample=$(basename $file | cut -d. -f 1)
cut -f 1 $file | awk -F ":" 'BEGIN{OFS="\t"} NR>1 {print $1,$2,$2,"0","-"}' > scramble_anno/$sample.avinput
table_annovar.pl scramble_anno/$sample.avinput \
$ANNOVAR_DATA/hg19 \
-buildver hg19 \
-remove \
-out scramble_anno/$sample \
--protocol refGene \
-operation  g \
--argument '-hgvs' --intronhgvs 100 \
--polish -nastring . \
--thread 1
awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {print "Gene","Intronic","AA"} NR>1 {print $7,$8,$10}' scramble_anno/$sample.hg19_multianno.txt | paste $file - > scramble_anno/$sample.outputR
Rscript /home/$USER/git/NGS_genotype_calling/NGS_generic_OGL/scramble_anno.R scramble_anno/$sample.outputR /data/OGL/resources/SCRAMBLEvariantClassification.xlsx /data/OGVFB/OGL_NGS/variant_prioritization/data/OGLv1_panel_DxORcandidate.tsv /data/OGL/resources/HGMD/HGMDtranscript.txt scramble_anno/$sample.scramble.xlsx $sample
done


while IFS= read -r sample
do
cut -f 1 scramble/$sample.mei.txt | awk -F ":" 'BEGIN{OFS="\t"} NR>1 {print $1,$2,$2,"0","-"}' > scramble_anno/$sample.avinput
table_annovar.pl scramble_anno/$sample.avinput \
$ANNOVAR_DATA/hg19 \
-buildver hg19 \
-remove \
-out scramble_anno/$sample \
--protocol refGene \
-operation  g \
--argument '-hgvs' --intronhgvs 100 \
--polish -nastring . \
--thread 1
awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {print "Gene","Intronic","AA"} NR>1 {print $7,$8,$10}' scramble_anno/$sample.hg19_multianno.txt | paste scramble/$sample.mei.txt - > scramble_anno/$sample.outputR
Rscript /home/$USER/git/NGS_genotype_calling/NGS_generic_OGL/scramble_anno.R scramble_anno/$sample.outputR /data/OGL/resources/SCRAMBLEvariantClassification.xlsx /data/OGVFB/OGL_NGS/variant_prioritization/data/OGLv1_panel_DxORcandidate.tsv /data/OGL/resources/HGMD/HGMDtranscript.txt scramble_anno/$sample.scramble.xlsx $sample
rm scramble_anno/$sample.avinput
rm scramble_anno/$sample.hg19_multianno.txt
rm scramble_anno/$sample.outputR
done < "tobeannoted.txt"

