#!/bin/bash

# Usage:
#   $ ./device_send_messages.sh <count> <sleep_milliseconds>
#   $ ./device_send_messages.sh 10 3.33
#
# Chris Joakim, Microsoft, 2020/10/26

msg_count=$1
sleep_milliseconds=$2

python device.py $msg_count $sleep_milliseconds

echo 'done'
