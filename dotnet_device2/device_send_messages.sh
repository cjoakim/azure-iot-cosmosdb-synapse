#!/bin/bash

# Usage:
#   $ ./device_send_messages.sh <count> <sleep_milliseconds>
#   $ ./device_send_messages.sh 10 1000
#
# Chris Joakim, Microsoft, 2020/12/14

#source ../az/bash_env_export.sh

msg_count=$1
sleep_milliseconds=$2

dotnet run $msg_count $sleep_milliseconds

echo 'done'
