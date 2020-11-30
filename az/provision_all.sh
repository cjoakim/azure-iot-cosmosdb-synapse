#!/bin/bash

# Bash script with AZ CLI to automate the creation of the resources for this project.
# Chris Joakim, Microsoft, 2020/11/30
#
# See https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest

# az login
# az account set -s $AZURE_SUBSCRIPTION_ID
# az account show  (confirm that your expected Azure Subscription is shown)

source ./provisioning_env.sh
sleep_seconds=60

./extensions.sh install
./extensions.sh list

./cosmos_sql.sh create
sleep $sleep_seconds
./cosmos_sql.sh info

./iothub.sh create
sleep $sleep_seconds
./iothub.sh info

./stream_analytics.sh create
sleep $sleep_seconds

./synapse.sh create 
sleep $sleep_seconds
./synapse.sh info
sleep $sleep_seconds

./synapse.sh create_spark_pool
sleep $sleep_seconds
./synapse.sh info
sleep $sleep_seconds

./synapse.sh create_sql_pool
sleep $sleep_seconds

./synapse.sh info

echo 'done'
