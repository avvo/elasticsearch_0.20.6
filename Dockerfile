## ############################################################################
## Creates a Docker image running Ubuntu and Elasticsearch 0.26.0
## ##########
##
## The intended use is for working on onni-full as getting
## Elasticsearch v 0.26.0 running locally involves reverting to 
## an earlier version of Java which may cause issues with other tools.
##
## ############################################################################

FROM openjdk:8-jre-slim

RUN apt-get update && \
    apt-get install -y wget 

## ############################################################################
## Get and install Elasticsearch 0.20.6

RUN cd /tmp && \
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-0.20.6.deb && \
    dpkg -i elasticsearch-0.20.6.deb && \
    rm elasticsearch-0.20.6.deb

## ############################################################################
## Clean Up

RUN apt-get remove -y --purge wget && \
    apt-get autoremove -y

## ############################################################################
## Run Forrest Run!
CMD /usr/share/elasticsearch/bin/elasticsearch -f

