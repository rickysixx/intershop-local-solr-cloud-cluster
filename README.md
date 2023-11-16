# Solr cluster for ICM 7.10 development environment

This Docker project creates a local [Solr Cloud](https://solr.apache.org/guide/solr/latest/deployment-guide/cluster-types.html#solrcloud-mode) cluster (Solr + ZooKeeper) which can be used in an ICM 7.10 development environment.

## Setup

1. clone this repository;
2. copy/rename the `.env.sample` file to `.env`;
3. if needed, adjust the configuration in the `.env` file (ports, etc.);
4. run `docker compose up -d` to create and start the cluster
5. add this to your `hosts` file:
  ```
  127.0.0.1    solr1
  ```
6. configure the ICM application server as explained [here](https://support.intershop.com/kb/index.php/Display/28A509#Guide-DeploymentSolrCloudServer-ConfiguretheIntershopCommerceManagement)
7. configure Solr basic authentication for the ICM application server (see [here](https://support.intershop.com/kb/index.php/Display/29T787#Cookbook-SolrCloudServer-Recipe:UseBasicAuthenticationforICM-SolrCloudServerCommunication)) or disable it entirely (see below for details)

## Basic authentication

This Solr cluster will use the [Basic Authentication Plugin](https://solr.apache.org/guide/solr/latest/deployment-guide/basic-authentication-plugin.html) (which is enabled by default). Users will be required to enter their credentials before accessing the Solr Admin page.

The configuration file `solr/docker-entrypoint-initdb.d/security-sample.json` will create 2 users:

username | password | notes
--- | --- | ---
`solr` | `SolrRocks` | admin rights
`intershop` | `intershop` |

You can customize this JSON file to use different credentials.

### Disable basic authentication

Solr basic authentication can be disabled by removing the `solr/docker-entrypoint-initdb.d` directory entirely and by adding this to the `solr1` service in the `docker-compose.yml`:
``` yml
command: ["-Dsolr.disableConfigSetsCreateAuthChecks=true"]
```
