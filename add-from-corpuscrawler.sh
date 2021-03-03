# Run:  $ bash add-from-corpuscrawler.sh

# Adapt: change value of `targetFilename`, see list on : github.com/google/corpuscrawler
targetFilename='ca-valencia'

# Download
curl http://www.gstatic.com/i18n/corpora/wordcounts/${targetFilename}.txt -O
# head ${targetFilename}.txt
# Count 'Corpus-Size'
corpusSize=`cat ${targetFilename}.txt | awk -F '\t' '{sum += $1} END {print sum}'`
# Add UNILEX header
echo $'Form	Frequency\n\n# SPDX-License-Identifier: Unicode-DFS-2016\n# Corpus-Size: '${corpusSize}$'\n' > tmp.txt
# head tmp.txt
# Swap columns
cat ${targetFilename}.txt | awk -F '\t' 'BEGIN { OFS=FS; NR>5 } { print $2, $1 }' >> tmp.txt
# head tmp.txt
# Format and dispatch to frequency folders (3)
mv tmp.txt ./unilex/data/frequency/${targetFilename}.txt
# head ./unilex/data/frequency/${targetFilename}.txt

# cat ./unilex/data/frequency/${targetFilename}.txt | tail -n +5 | sort -k 2,2 -n -r > ./unilex/data/frequency-sorted-count/${targetFilename}.txt
## head ./unilex/data/frequency-sorted-count/${targetFilename}.txt
# cat ./unilex/data/frequency/${targetFilename}.txt | tail -n +5 | sort -k 2,2 -n -r | cut -d$'\t' -f1 | sed -E 's/^/# /g' > ./unilex/data/frequency-sorted-hash/${targetFilename}.txt
## head ./unilex/data/frequency-sorted-hash/${targetFilename}.txt

