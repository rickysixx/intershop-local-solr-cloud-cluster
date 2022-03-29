This Compose projects activates HTTP basic authentication on Solr and creates 2 users (`intershop` / `!InterShop00!` and `solr` / `SolrRocks`).

You can customize `solr/docker-entrypoint-initdb.d/configure-authentication.sh` and `solr/docker-entrypoint-initdb.d/security-sample.json` to use another authentication plugin or credentials.

If you want to disable the authentication, you should delete the `solr/docker-entrypoint-initdb.d` directory and then add this to the `solr1` service in `docker-compose.yml`:
``` yml
command: ["-Dsolr.disableConfigSetsCreateAuthChecks=true"]
```

To properly connect this Solr Cloud cluster with Intershop, see [this guide](https://support.intershop.com/kb/28A509). You should also add the following to your `hosts` file:
```
127.0.0.1    solr1
```
