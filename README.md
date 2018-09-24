## Elasticsearch v0.20.6 Image Dockerfile

The Ignite app ([onni-full](https://github.com/avvo/onni-full)) is a special snowflake that has been running in production for a long time and has been very stable.

So stable, in fact, that there haven't been any major changes since 2015. The bulk of the system was built using technologies from 2012 / 2013.

One of the dependencies of Ignite is Elasticsearch, namely version 0.20.6. It was easier to build this image than to upgrade the Elasticsearch in use by Ignite, 
or to make Elasticsearch 0.20.6 run locally.

This repo includes a build.sh script to build the image.

It is understood at this time that the resulting Docker image will be used on development machine and does not need to be deployed any further.

### Run Locally To Support onni-full dev work:

1. Clone this repo:

`git clone git@github.com:avvo/elasticsearch_0.20.6.git`

1. Build the Docker image:

`cd elasticsearch_0.20.6 && ./build.sh`

1. Start a container using the image:

`./run.sh`


You should now be able to run the onni-full/dashboard and onni-full/onni tests (`bundle exec rake`)


