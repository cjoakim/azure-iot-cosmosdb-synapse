#!/bin/bash

# Bash script with AZ CLI to automate the creation of the resources for this project.
# Chris Joakim, Microsoft, 2020/11/30
#
# See https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest

# az login
# az account set -s $AZURE_SUBSCRIPTION_ID
# az account show  (confirm that your expected Azure Subscription is shown)

source ./provisioning_env.sh

./extensions.sh install
./extensions.sh list

./storage.sh create 

./cosmos_sql.sh create

./iothub.sh create

./stream_analytics.sh create

./synapse.sh create pause create_spark_pool pause create_sql_pool pause info

echo 'done'
