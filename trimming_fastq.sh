#!/bin/bash

module load fastxtoolkit
trimmed-length = $1
for file in *.fastq.gz;
 do 
 gunzip -c $file | fastx_trimmer -l $1 -i - | gzip - > $1-$file; done
 