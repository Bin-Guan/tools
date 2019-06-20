#!/bin/bash

sed 's/'^chr'//g' $1 > file_nochr
grep -v -e '^X' -e '^Y' file_nochr | sort -k 1,1n -k2,2n > autosomal
grep -e '^X' -e '^Y' file_nochr | sort -k 1,1 -k2,2n > sex
cat autosomal sex > $2
rm file_nochr
rm autosomal
rm sex
