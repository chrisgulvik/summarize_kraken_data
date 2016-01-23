# Summarize Kraken Data
#### *emphasis on contamination assessment of genome sequencing efforts*

* * *

![alt tag](https://github.com/chrisgulvik/images/raw/master/kraken.jpg)

#### Script:
* **summarize_kraken-report.sh** -- generates a TSV summary of unclassified, the 3 most abundant genera, and 3 most abundant species from a kraken-report file. (requires GNU sed)

  Step 1 ) _Generate kraken report_: `kraken --threads $CPUs --preload --paired --fastq-input sample_R[12].fq | kraken-report > sample.kraken-report.tsv`

  Step 2 )  _Summarize_: `bash summarize_kraken-report.sh sample.kraken-report.tsv > sample.kraken-summary.tsv`  
