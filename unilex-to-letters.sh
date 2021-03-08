# Define language
iso=mr
# get file, cut out meta, sort by 2nd column (frequency), keep 50000, keep only word, sort by 1st column, alphabetically, save to .txt file
curl https://raw.githubusercontent.com/unicode-org/unilex/master/data/frequency/${iso}.txt | tail -n +6 | sort -k 2,2 -n -r | head -n 100000 | cut -d$'\t' -f1 | sort -k 1,1 > ${iso}.txt
# get mr.txt content, for all line starting with alpha-num, convert first letter to lowercase, then print in files depending on first symbol
cat mr.txt | awk '{file = (/^[[:alnum:]]/ ? tolower(substr($0,1,1)) : "symbol") ".txt"; print >> file; close(file)}'
# Remove a to z files
find . -regex './[a-z].txt' -delete
# Convert to wiki lists format `# {item}
sed -i -E 's/^/# /g' `find . -type f -name "?.txt"`
# See line counts, sorted numerically descendant
wc -l * | sort -n -r
# See lines count, if n<200 then print filename, add file to merged.txt
wc -l * | awk '$1 < 200 {print $2}' | xargs cat >> others.txt