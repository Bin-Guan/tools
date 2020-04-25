for file in *.txt; do 
grep "^X" $file > temp/$file
awk '{ sum+=$9 } END { if (sum/NR > 0.75) {print "cp " FILENAME " ../OGLv1_female/" FILENAME} else {print "cp " FILENAME " ../OGLv1_male/" FILENAME} }' temp/$file | sed 's/temp\///g' >> cp_male_female.sh;
done
