FROM openjdk:8-jdk-alpine

# Install R
RUN apk add R && \
    R -e "install.packages(c('data.table','dplyr','dtplyr','lubridate','markdown','networkD3','stringi', 'DT', 'devtools', 'stringr'), repos='$MRAN')"
    # R -e "devtools::install_github('rstudio/leaflet')" && \
    # R -e "devtools::install_github('bhaskarvk/leaflet.extras')"

ENV LC_ALL C
ENV LANGUAGE en_US:en
ENV LC_CTYPE en_US.UTF-8

EXPOSE 3838
