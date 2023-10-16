
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Elasticsearch Cluster Health Showing Red
---

This incident type occurs when the health status of an Elasticsearch cluster changes to red, indicating that there are critical issues impacting the cluster's ability to function properly. This can be caused by various factors such as hardware failures, network issues, or software bugs, and requires immediate attention to prevent data loss or service disruption. Resolving this incident type requires a thorough investigation of the underlying issue and applying appropriate fixes to restore the cluster's health to normal.

### Parameters
```shell
export LOCALHOST_9200="PLACEHOLDER"

export PATH_TO_ELASTICSEARCH_LOGS="PLACEHOLDER"
```

## Debug

### Check if Elasticsearch service is running
```shell
systemctl status elasticsearch.service
```

### Check Elasticsearch logs for any errors
```shell
journalctl -u elasticsearch.service --no-pager | tail -n 50
```

### Check Elasticsearch cluster health status
```shell
curl -s -XGET '${LOCALHOST_9200}/_cat/health?v'
```

### Check Elasticsearch cluster nodes
```shell
curl -s -XGET '${LOCALHOST_9200}/_cat/nodes?v'
```

### Check Elasticsearch cluster indices
```shell
curl -s -XGET '${LOCALHOST_9200}/_cat/indices?v'
```

### Check Elasticsearch cluster shard allocation
```shell
curl -s -XGET '${LOCALHOST_9200}/_cat/shards?v'
```

### Check Elasticsearch cluster disk usage
```shell
curl -s -XGET '${LOCALHOST_9200}/_cat/allocation?v'
```

### Check Elasticsearch cluster stats
```shell
curl -s -XGET '${LOCALHOST_9200}/_cluster/stats?human&pretty'
```

### Check Elasticsearch cluster settings
```shell
curl -s -XGET '${LOCALHOST_9200}/_cluster/settings?pretty'
```

### Check the Elasticsearch cluster logs for any errors that could be causing the red health status. Once identified, fix the issue or escalate it to the appropriate team member.
```shell


#!/bin/bash



# Set the Elasticsearch logs path

ELASTICSEARCH_LOGS=${PATH_TO_ELASTICSEARCH_LOGS}



# Check if the Elasticsearch logs file exists

if [ ! -f $ELASTICSEARCH_LOGS ]; then

    echo "Elasticsearch logs file does not exist"

    exit 1

fi



# Check for errors in the Elasticsearch logs

ERROR_COUNT=$(grep -i "error" $ELASTICSEARCH_LOGS | wc -l)

if [ $ERROR_COUNT -eq 0 ]; then

    echo "No errors found in Elasticsearch logs"

    exit 0

else

    # If errors are found, fix the issue or escalate to the appropriate team member

    echo "$ERROR_COUNT errors found in Elasticsearch logs"

    # Code to fix the issue goes here

    # If issue cannot be fixed, escalate to the appropriate team member

    # Code to escalate the issue goes here

    exit 1

fi


```