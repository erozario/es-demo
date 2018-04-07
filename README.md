# Elasticsearch Demo

Elasticsearch and Kibana Docker Cluster

## Requirements

- [Make](https://www.gnu.org/software/make/)
- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- 6GB Of RAM

## How to test this ?

Follow this steps

1. Clone this repository
1. Run all containers with `make up`
1. Set elasticsearch.local in hosts with `make hostname`
1. Verify address `http://elasticsearch.local:9200` for access elasticsearch
1. Verify address `http://elasticsearch.local` for access Kibana