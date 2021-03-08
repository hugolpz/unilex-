# unilex-extended
UNILEX data extended to ease downstream more usages.

### Install
```
git clone git@github.com:lingua-libre/unilex-extended.git    # clone base repository
git submodule update --init --recursive                      # update/Install submodules locally
```

### Tools
This directory contains scripts to convert from original unilex data :
* `./add-from-corpuscrawler.sh`: if data is in google/corpuscrawler but not in current unicode-org/unilex repository, pull it in.
* `./to-sorted.sh`: takes unilex/data/frequency/{IETF}.xt, converts `./frequency-sorted-count/{IETF}.txt` and `./frequency-sorted-hash/{IETF}.txt`.
* `./unilex-to-letters.sh`: for a given {IETF}.txt target, transform frequency files into *n* files, one per letter. See human-friendly inline comments. Default: `mr` (Marathi).

### Data
* `./frequency-sorted-count/`: format `na	77968661`, sorted by count descendant.
* `./frequency-sorted-hash/`:  format `# na` (wiki list), sorted by count descendant.

### License
Data is under Unicode License (GNU-like).
