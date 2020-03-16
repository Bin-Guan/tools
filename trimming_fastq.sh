#!/bin/bash

module load fastxtoolkit
#trimmed-length = $1
mkdir -p fastq$1
for file in LGE_CnR_4_S4_*.fastq.gz;
 do 
 gunzip -c $file | fastx_trimmer -l $1 -i - | gzip - > fastq$1/$file; done
 