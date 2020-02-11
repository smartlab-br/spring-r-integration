FROM r-base:3.6.2

RUN apt update && \
    apt install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install R
RUN R CMD javareconf && \
    R -e "install.packages(c('data.table','dplyr','stringr','DT','rmarkdown','rkafka','rredis','ggplot2','ggrepel','mapview','tidyr','RNeo4j','DBI'), repo='mran.microsoft.com')"
    # R -e "devtools::install_github('rstudio/leaflet')" && \
    # R -e "devtools::install_github('bhaskarvk/leaflet.extras')"

ENV LC_ALL C
ENV LANGUAGE en_US:en
ENV LC_CTYPE en_US.UTF-8

EXPOSE 3838
