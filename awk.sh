awk -F"\t" 'BEGIN{OFS="\t"} NR==1 {print $0, "SampleID"} NR>1 {n = split($1,sample,","); for (i = 1; i <=n; i++) {print $0, sample[i]} }' input > output
