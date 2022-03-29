#!/bin/bash

set -e

/opt/solr-8.11.1/server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd putfile /security.json /docker-entrypoint-initdb.d/security-sample.json