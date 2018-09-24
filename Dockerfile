## #######################################################################
## Creates a Docker image running Ubuntu and Elasticsearch 0.26.0
## ##########
##
## The intended use is for working on onni-full as getting
## Elasticsearch v 0.26.0 running locally involves reverting to 
## an earlier version of Java which may cause issues with other tools.
##
## #######################################################################

FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:webupd8team/java

RUN apt-get update

## Accepts the Oracle license

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get install -y oracle-java8-installer

## Clean Up

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

## ####################################################################
## Get and install Elasticsearch 0.20.6

RUN cd /tmp && \
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-0.20.6.deb && \
    dpkg -i elasticsearch-0.20.6.deb 

CMD /usr/share/elasticsearch/bin/elasticsearch -f

