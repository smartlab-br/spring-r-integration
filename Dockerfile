FROM r-base:3.6.2

RUN apt update && \
    apt install -y openjdk-8-jdk libcurl4-openssl-dev libssl-dev libxml2-dev libudunits2-dev libfontconfig1-dev git neo4j-client && \
    apt install -y --allow-downgrades libxcb1=1.13.1-2 libxcb-render0=1.13.1-2 libxcb-shm0=1.13.1-2 && \
    apt install -y libcairo2-dev libgdal-dev pandoc pandoc-citeproc libjq-dev libxt-dev xtail && \
    cd opt && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    cd .. && \
    locale-gen pt_BR.UTF-8
    
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV OPENSSL_CONF=/etc/ssl/

# Install R
RUN R CMD javareconf && \
    R -e "install.packages(c('data.table','dplyr','stringr','DT','rmarkdown','rkafka','rredis','ggplot2','ggrepel','tidyr','DBI'), repo='mran.microsoft.com')" && \
    R -e "install.packages(c('RCurl','httr','devtools','mapview','knitr','kableExtra','htmltools','webshot'), repo='mran.microsoft.com')" && \
    R -e "devtools::install_github('nicolewhite/RNeo4j')" && \
    R -e "webshot::install_phantomjs()" && \
    R -e "devtools::install_github('rstudio/leaflet')" && \
    R -e "devtools::install_github('bhaskarvk/leaflet.extras')"

# ENV LC_ALL C
# ENV LANGUAGE en_US:en
# ENV LC_CTYPE en_US.UTF-8

ENV LC_ALL Portuguese
ENV LANGUAGE pt_BR:en_US:en
ENV LC_CTYPE pt_BR.UTF-8

EXPOSE 3838
