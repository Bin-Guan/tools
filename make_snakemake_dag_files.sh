# add --dag in the snakemake.wrapper file.
module load snakemake
module load graphviz
bash ~/git/variant_prioritization/ForDagFig.Snakemake.wrapper.sh config_variant_prioritization.yaml | dot -Tsvg > test.svg
