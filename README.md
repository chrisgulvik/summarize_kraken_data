# Summarize Kraken Data
#### *emphasis on contamination assessment of bacterial genome sequencing efforts*

* * *

![alt tag](https://github.com/chrisgulvik/images/raw/master/kraken.jpg)

#### Scripts:
* **summarize_kraken-report.sh** -- generates a TSV summary of unclassified, the 3 most abundant genera, and 3 most abundant species from a kraken-report file. (requires GNU sed)

  Step 1 ) _Generate kraken report_: `kraken --threads $CPUs --preload --paired --fastq-input sample_R[12].fq | kraken-report > sample.kraken-report.tsv`

  Step 2 )  _Summarize_: `summarize_kraken-report.sh sample.kraken-report.tsv > sample.kraken-summary.tsv`

* **summarize-kraken.sh** -- makes tab-delimited summary of kraken reports (GNU sed required)

  Step 1) _Batch create kraken reports_: `mkdir ../kraken && for F in *.R1.paired.fq; do B=$(basename $F .R1.paired.fq); kraken --threads 31 --preload --paired --fastq-input "$B".R1.paired.fq "$B".R2.paired.fq | kraken-report > ../kraken/"$B"_kraken.tab; done`

  Step 2) _Summarize all reports into a single file_: `for F in ../*_kraken.tab; do summarize_kraken.sh $F >> ../Summary_kraken.tab; done`

  Step 3) _Append header (optional)_: `awk 'BEGIN{print "ID\tUnclassified Reads [%]\tUnclassified Reads [#]\tunclassified\tTop Classified Reads [%]\tTop Classified Reads [#]\tTop Classified Genus\t2nd Top Classified Reads [%]\t2nd Top Classified Reads [#]\t2nd Top Classified Genus\t3rd Top Classified Reads [%]\t3rd Top Classified Reads [#]\t3rd Top Classified Genus\tTop Classified Reads [%]\tTop Classified Reads [#]\tTop Classified Species\t2nd Top Classified Reads [%]\t2nd Top Classified Reads [#]\t2nd Top Classified Species\t3rd Top Classified Reads [%]\t3rd Top Classified Reads [#]\t3rd Top Classified Species"}1' ../Summary_kraken.tab | cut -f 1-3,5- > ../Summary_kraken-inclheader.tab`

#### Example Installation of Kraken:

    # Compile
    curl https://ccb.jhu.edu/software/kraken/dl/kraken-0.10.5-beta.tgz -o ~/Downloads/kraken-0.10.5-beta.tgz
    mkdir ~/kraken
    tar zxvf ~/Downloads/kraken-0.10.5-beta.tgz -C ~/kraken --strip-components=1
    bash ~/kraken/install_kraken.sh ~/Kraken
    rm -r ~/kraken

    # Download MiniKraken DB
    curl http://ccb.jhu.edu/software/kraken/dl/minikraken.tgz -o ~/Kraken/minikraken.tgz
    mkdir ~/Kraken/MiniKrakenDB
    tar zxvf ~/Kraken/minikraken.tgz -C ~/Kraken/MiniKrakenDB --strip-components=1

    # Update paths
    echo 'export PATH="$PATH:$HOME/Kraken"' >> $HOME/.bash_profile
    echo 'export KRAKEN_DB_PATH="$HOME/Kraken/MiniKrakenDB"' >> $HOME/.bash_profile
    echo 'export KRAKEN_DEFAULT_DB="$HOME/Kraken/MiniKrakenDB"' >> $HOME/.bash_profile
