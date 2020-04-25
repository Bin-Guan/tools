#!/bin/bash

#Platinum Genomes (HG001) FASTQ
cd /scratch/guanb/
mkdir -p platinum
cd platinum
wget https://storage.googleapis.com/genomics-public-data/platinum-genomes/fastq/ERR194147_1.fastq.gz
wget https://storage.googleapis.com/genomics-public-data/platinum-genomes/fastq/ERR194147_2.fastq.gz
