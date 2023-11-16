#!/bin/bash

set -e

/opt/solr-${SOLR_VERSION}/server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd putfile /security.json /docker-entrypoint-initdb.d/security-sample.json
