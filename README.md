# Summarize Kraken Data
#### *emphasis on contamination assessment of bacterial genome sequencing efforts*

* * *

![alt tag](https://github.com/chrisgulvik/images/raw/master/kraken.jpg)

#### Script:
* **summarize_kraken-report.sh** -- generates a TSV summary of unclassified, the 3 most abundant genera, and 3 most abundant species from a kraken-report file. (requires GNU sed)

  Step 1 ) _Generate kraken report_: `kraken --threads $CPUs --preload --paired --fastq-input sample_R[12].fq | kraken-report > sample.kraken-report.tsv`

  Step 2 )  _Summarize_: `bash summarize_kraken-report.sh sample.kraken-report.tsv > sample.kraken-summary.tsv`  

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
