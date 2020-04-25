#!/bin/bash

#for file in RAWDATA/*.bam; do sbatch --mem=12g ~/git/tools/bazam/simpleBazam.sh $file; done
file=$1
filename=$(basename $file)
java -Xmx12g -jar ~/git/bazam/build/libs/bazam.jar -r1 fastq/${filename%.bam}_R1_001.fastq.gz -r2 fastq/${filename%.bam}_R2_001.fastq.gz -bam $file
