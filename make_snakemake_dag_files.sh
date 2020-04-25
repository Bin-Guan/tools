#!/bin/bash

module load graphviz
module load snakemake

#Add a sample input file, add --dag to the snakemake command

bash snakemake.wrapper.sh config argument | dot -Tsvg something.svg

#-Tpdf or -Tpng etc. for other file types