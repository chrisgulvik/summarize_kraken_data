#!/bin/bash

### Creates a 3-col summary from kraken-report output
### containing:  %reads, #reads, and Identity

# Unclassified
UNCL=( `grep $'\tU\t' $1 | head -n1 | awk '{print $1,$2,$6}'` )
if [[ ${#UNCL[@]} -eq 3 ]]; then
	echo ${UNCL[@]};
else
	echo -e "0\t0\tUnclassified"
fi

# At most top 3 genera
while read -r l; do
	tabline=$(echo "$l" | sed -E 's/ +/%\t/1' | sed -E 's/ +/\t/1');
	echo "$tabline";
done < <(grep $'\tG\t' $1 | head -n3 | awk -F $'\t' '{print $1,$2,$6}')

# At most top 3 species
while read -r l; do
	tabline=$(echo "$l" | sed -E 's/ +/%\t/1' | sed -E 's/ +/\t/1');
	echo "$tabline";
done < <(grep $'\tS\t' $1 | head -n3 | awk -F $'\t' '{print $1,$2,$6}')
