<<<<<<< HEAD
#!/bin/bash

module load graphviz
module load snakemake

#Add a sample input file, add --dag to the snakemake command

bash snakemake.wrapper.sh config argument | dot -Tsvg something.svg

#-Tpdf or -Tpng etc. for other file types
=======
# add --dag in the snakemake.wrapper file.
module load snakemake
module load graphviz
bash ~/git/variant_prioritization/ForDagFig.Snakemake.wrapper.sh config_variant_prioritization.yaml | dot -Tsvg > test.svg
>>>>>>> 92f4c0105e8f6a72a407436873ac081ee91d4e45
