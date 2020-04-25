#!/bin/bash

#sinteractive --cpus-per-task=20 --mem=128g
#finished one midi-run in less than 5 min.
#samplesheet should be named as SampleSheet.csv if no sample sheet is specified in the command below

module load bcl2fastq/2.20.0

bcl2fastq --runfolder-dir . --output-dir ./fastq -r 4 -w 4 -p 12 --barcode-mismatches 0

#read 4, write 4, processing 12


