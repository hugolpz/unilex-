mkdir -p ./frequency-sorted-hash ./frequency-sorted-count
for filename in ./unilex/data/frequency/*.txt; do
    [ -e "$filename" ] || continue
    echo "Processing: $(basename "$filename" .txt).txt "
    cat ./unilex/data/frequency/$(basename "$filename" .txt).txt | tail -n +5 | sort -k 2,2 -n -r | sed '$ {/^$/d;}' | cut -d$'\t' -f1 | sed -E 's/^/# /g' > ./frequency-sorted-hash/$(basename "$filename" .txt).txt
    cat ./unilex/data/frequency/$(basename "$filename" .txt).txt | tail -n +5 | sort -k 2,2 -n -r | sed '$ {/^$/d;}' > ./frequency-sorted-count/$(basename "$filename" .txt).txt
done
